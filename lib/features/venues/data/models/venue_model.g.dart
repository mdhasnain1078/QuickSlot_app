// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VenueModelImpl _$$VenueModelImplFromJson(Map<String, dynamic> json) =>
    _$VenueModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      sportType: json['sport_type'] as String,
      location: json['location'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$VenueModelImplToJson(_$VenueModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'sport_type': instance.sportType,
      'location': instance.location,
      'rating': instance.rating,
    };

_$SlotModelImpl _$$SlotModelImplFromJson(Map<String, dynamic> json) =>
    _$SlotModelImpl(
      id: json['_id'] as String,
      venueId: json['venue_id'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$SlotModelImplToJson(_$SlotModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'venue_id': instance.venueId,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
    };
