import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quickslot/core/widgets/shared_widgets.dart';
import 'package:quickslot/features/auth/presentation/providers/auth_provider.dart';
import 'package:quickslot/features/bookings/data/models/booking_model.dart';
import 'package:quickslot/features/bookings/data/repositories/booking_repository.dart';
import 'package:quickslot/features/venues/data/repositories/venue_repository.dart';

class VenueDetailScreen extends ConsumerStatefulWidget {
  final String venueId;

  const VenueDetailScreen({super.key, required this.venueId});

  @override
  ConsumerState<VenueDetailScreen> createState() => _VenueDetailScreenState();
}

class _VenueDetailScreenState extends ConsumerState<VenueDetailScreen> {
  late String selectedDate;
  late DateTime listStartDate;
  String? selectedSlotId;

  final List<String> _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    selectedDate = now.toString().split(' ')[0];
    listStartDate = now;
  }

  void _bookSlot() async {
    if (selectedSlotId == null) return;
    final user = ref.read(authProvider);
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a user first.')));
      return;
    }

    final booking = BookingModel(
      userId: user.id,
      venueId: widget.venueId,
      slotId: selectedSlotId!,
      date: selectedDate,
    );

    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const AppLoader(),
      );
      await ref.read(bookingRepositoryProvider).createBooking(booking);
      if (context.mounted) {
        Navigator.pop(context); // Remove loader
        context.go('/booking-success');
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context); // Remove loader
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString().replaceAll('Exception: ', '')),
          backgroundColor: Theme.of(context).colorScheme.error,
        ));
        // Refresh slots as it might be booked by someone else
        ref.refresh(slotsProvider('${widget.venueId}|$selectedDate'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final slotsState = ref.watch(slotsProvider('${widget.venueId}|$selectedDate'));

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('Select Slot', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
                InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.parse(selectedDate),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 90)),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: Color(0xFF4F46E5),
                              onPrimary: Colors.white,
                              onSurface: Colors.black,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDate = picked.toString().split(' ')[0];
                        listStartDate = picked;
                        selectedSlotId = null;
                      });
                    }
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4F46E5).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.calendar_month_rounded, size: 16, color: Color(0xFF4F46E5)),
                        SizedBox(width: 4),
                        Text('Pick Date', style: TextStyle(color: Color(0xFF4F46E5), fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Horizontal Date Picker
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 14, // Show 14 days from listStartDate
              itemBuilder: (context, index) {
                final date = listStartDate.add(Duration(days: index));
                final dateStr = date.toString().split(' ')[0];
                final isSelected = selectedDate == dateStr;
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = dateStr;
                      selectedSlotId = null;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 70,
                    margin: const EdgeInsets.only(right: 12, bottom: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF4F46E5) : Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: isSelected ? [
                        BoxShadow(color: const Color(0xFF4F46E5).withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 4))
                      ] : [
                        BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 2))
                      ],
                      border: Border.all(color: isSelected ? Colors.transparent : Colors.grey.shade200),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_weekdays[date.weekday - 1], style: TextStyle(color: isSelected ? Colors.white70 : Colors.grey.shade500, fontSize: 13, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text('${date.day}', style: TextStyle(color: isSelected ? Colors.white : const Color(0xFF111827), fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 15),
            child: Text('Available Times', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
          ),
          Expanded(
            child: slotsState.when(
              data: (slots) {
                if (slots.isEmpty) return const Center(child: Text('No slots available for this date.', style: TextStyle(color: Colors.grey)));
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: slots.length,
                  itemBuilder: (context, index) {
                    final slot = slots[index];
                    final isAvailable = slot.status == 'available';
                    final isSelected = selectedSlotId == slot.id;

                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: isAvailable
                          ? () {
                              setState(() {
                                selectedSlotId = slot.id;
                              });
                            }
                          : null,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF4F46E5) : (isAvailable ? Colors.white : Colors.grey.shade200),
                          border: Border.all(color: isSelected ? const Color(0xFF4F46E5) : (isAvailable ? Colors.grey.shade300 : Colors.transparent)),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isSelected ? [
                            BoxShadow(color: const Color(0xFF4F46E5).withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 3))
                          ] : [],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          slot.time,
                          style: TextStyle(
                            color: isSelected ? Colors.white : (isAvailable ? const Color(0xFF374151) : Colors.grey.shade500), 
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const GridShimmerLoader(),
              error: (e, _) => AppErrorWidget(
                message: e.toString(),
                onRetry: () => ref.refresh(slotsProvider('${widget.venueId}|$selectedDate')),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), offset: const Offset(0, -4), blurRadius: 20)
            ]
          ),
          child: ElevatedButton(
            onPressed: selectedSlotId != null ? _bookSlot : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4F46E5),
              disabledBackgroundColor: Colors.grey.shade300,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: selectedSlotId != null ? 8 : 0,
              shadowColor: const Color(0xFF4F46E5).withOpacity(0.5),
            ),
            child: const Text('Confirm Booking', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
