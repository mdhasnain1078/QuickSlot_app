import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quickslot/core/widgets/shared_widgets.dart';
import 'package:quickslot/features/auth/presentation/providers/auth_provider.dart';
import 'package:quickslot/features/venues/data/repositories/venue_repository.dart';

class VenueListScreen extends ConsumerWidget {
  const VenueListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final venuesState = ref.watch(venuesProvider);

    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.sports_soccer_outlined),
        title: const Text('Venues', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded),
            tooltip: 'My Bookings',
            onPressed: () {
              context.push('/bookings');
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Change User',
            onPressed: () {
              ref.read(authProvider.notifier).logout();
              context.go('/auth');
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: venuesState.when(
        data: (venues) {
          if (venues.isEmpty) {
            return const Center(child: Text('No venues available.'));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(venuesProvider.notifier).fetchVenues(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: venues.length,
              itemBuilder: (context, index) {
                final venue = venues[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      context.push('/venues/${venue.id}');
                    },
                    child: Stack(
                      children: [
                        // Full Background Image
                        Container(
                          height: 240,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                          ),
                          child: venue.image.isNotEmpty
                              ? Image.network(
                                  venue.image,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                                )
                              : const Icon(Icons.image, size: 50, color: Colors.grey),
                        ),
                        // Dark Gradient Overlay for Text Readability
                        Container(
                          height: 240,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black.withOpacity(0.85)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0.4, 1.0],
                            ),
                          ),
                        ),
                        // Text Content positioned at the bottom
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                venue.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  // Sport Badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF4F46E5), // Modern Indigo
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      venue.sportType.toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 11,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Rating
                                  Row(
                                    children: [
                                      const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                                      const SizedBox(width: 4),
                                      Text(
                                        venue.rating.toString(),
                                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  // Location
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(Icons.location_on_rounded, size: 16, color: Colors.white70),
                                        const SizedBox(width: 4),
                                        Flexible(
                                          child: Text(
                                            venue.location,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        loading: () => const ListShimmerLoader(),
        error: (error, _) => AppErrorWidget(
          message: error.toString(),
          onRetry: () => ref.read(venuesProvider.notifier).fetchVenues(),
        ),
      ),
    );
  }
}
