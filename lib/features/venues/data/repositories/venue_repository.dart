import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:quickslot/core/network/api_client.dart';
import 'package:quickslot/features/venues/data/models/venue_model.dart';

final venueRepositoryProvider = Provider<VenueRepository>((ref) {
  return VenueRepository(apiClient.dio);
});

class VenueRepository {
  final Dio _dio;

  VenueRepository(this._dio);

  Future<List<VenueModel>> getVenues() async {
    try {
      final response = await _dio.get('/venues/');
      if (response.data['success'] == true) {
        final List data = response.data['data'];
        return data.map((e) => VenueModel.fromJson(e)).toList();
      }
      throw Exception(response.data['message']);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }

  Future<List<SlotModel>> getVenueSlots(String venueId, String date) async {
    try {
      final response = await _dio.get(
        '/venues/$venueId/slots',
        queryParameters: {'date': date},
      );
      if (response.data['success'] == true) {
        final List data = response.data['data'];
        return data.map((e) => SlotModel.fromJson(e)).toList();
      }
      throw Exception(response.data['message']);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? e.message);
    }
  }
}

// State Notifiers
final venuesProvider = StateNotifierProvider<VenuesNotifier, AsyncValue<List<VenueModel>>>((ref) {
  return VenuesNotifier(ref.watch(venueRepositoryProvider));
});

class VenuesNotifier extends StateNotifier<AsyncValue<List<VenueModel>>> {
  final VenueRepository _repository;

  VenuesNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchVenues();
  }

  Future<void> fetchVenues() async {
    try {
      final venues = await _repository.getVenues();
      state = AsyncValue.data(venues);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

// Slots provider for a specific venue and date
final slotsProvider = FutureProvider.autoDispose.family<List<SlotModel>, String>((ref, params) async {
  final parts = params.split('|');
  final repository = ref.read(venueRepositoryProvider);
  return repository.getVenueSlots(parts[0], parts[1]);
});
