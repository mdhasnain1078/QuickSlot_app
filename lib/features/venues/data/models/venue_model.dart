import 'package:freezed_annotation/freezed_annotation.dart';

part 'venue_model.freezed.dart';
part 'venue_model.g.dart';

@freezed
class VenueModel with _$VenueModel {
  const factory VenueModel({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String image,
    @JsonKey(name: 'sport_type') required String sportType,
    required String location,
    required double rating,
  }) = _VenueModel;

  factory VenueModel.fromJson(Map<String, dynamic> json) => _$VenueModelFromJson(json);
}

@freezed
class SlotModel with _$SlotModel {
  const factory SlotModel({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'venue_id') required String venueId,
    required String date,
    required String time,
    required String status,
  }) = _SlotModel;

  factory SlotModel.fromJson(Map<String, dynamic> json) => _$SlotModelFromJson(json);
}
