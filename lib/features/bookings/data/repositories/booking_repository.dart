import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:quickslot/core/network/api_client.dart';
import 'package:quickslot/features/auth/presentation/providers/auth_provider.dart';
import 'package:quickslot/features/bookings/data/models/booking_model.dart';

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  return BookingRepository(apiClient.dio);
});

class BookingRepository {
  final Dio _dio;

  BookingRepository(this._dio);

  Future<BookingModel> createBooking(BookingModel booking) async {
    try {
      final response = await _dio.post('/bookings/', data: booking.toJson());
      if (response.data['success'] == true) {
        return BookingModel.fromJson(response.data['data']);
      }
      throw Exception(response.data['message']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        throw Exception("Slot already booked");
      }
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }

  Future<List<BookingModel>> getUserBookings(String userId) async {
    try {
      final response = await _dio.get('/users/$userId/bookings');
      if (response.data['success'] == true) {
        final List data = response.data['data'];
        return data.map((e) => BookingModel.fromJson(e)).toList();
      }
      throw Exception(response.data['message']);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }

  Future<bool> cancelBooking(String bookingId) async {
    try {
      final response = await _dio.delete('/bookings/$bookingId');
      return response.data['success'] == true;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }
}

final userBookingsProvider = StateNotifierProvider.autoDispose<UserBookingsNotifier, AsyncValue<List<BookingModel>>>((ref) {
  final repo = ref.watch(bookingRepositoryProvider);
  final user = ref.watch(authProvider);
  return UserBookingsNotifier(repo, user?.id);
});

class UserBookingsNotifier extends StateNotifier<AsyncValue<List<BookingModel>>> {
  final BookingRepository _repository;
  final String? _userId;

  UserBookingsNotifier(this._repository, this._userId) : super(const AsyncValue.loading()) {
    if (_userId != null) {
      fetchBookings();
    } else {
      state = const AsyncValue.data([]);
    }
  }

  Future<void> fetchBookings() async {
    if (_userId == null) return;
    try {
      final bookings = await _repository.getUserBookings(_userId!);
      state = AsyncValue.data(bookings);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<bool> cancelBooking(String bookingId) async {
    try {
      await _repository.cancelBooking(bookingId);
      await fetchBookings();
      return true;
    } catch (e) {
      return false;
    }
  }
}
