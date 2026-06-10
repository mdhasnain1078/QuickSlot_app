// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      id: json['_id'] as String?,
      userId: json['user_id'] as String,
      venueId: json['venue_id'] as String,
      slotId: json['slot_id'] as String,
      date: json['date'] as String,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'user_id': instance.userId,
      'venue_id': instance.venueId,
      'slot_id': instance.slotId,
      'date': instance.date,
      'created_at': instance.createdAt,
    };
