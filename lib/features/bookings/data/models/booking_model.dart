import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
class BookingModel with _$BookingModel {
  const factory BookingModel({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'venue_id') required String venueId,
    @JsonKey(name: 'slot_id') required String slotId,
    required String date,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
}
