// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'venue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VenueModel _$VenueModelFromJson(Map<String, dynamic> json) {
  return _VenueModel.fromJson(json);
}

/// @nodoc
mixin _$VenueModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'sport_type')
  String get sportType => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;

  /// Serializes this VenueModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VenueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VenueModelCopyWith<VenueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VenueModelCopyWith<$Res> {
  factory $VenueModelCopyWith(
    VenueModel value,
    $Res Function(VenueModel) then,
  ) = _$VenueModelCopyWithImpl<$Res, VenueModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String name,
    String image,
    @JsonKey(name: 'sport_type') String sportType,
    String location,
    double rating,
  });
}

/// @nodoc
class _$VenueModelCopyWithImpl<$Res, $Val extends VenueModel>
    implements $VenueModelCopyWith<$Res> {
  _$VenueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VenueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? sportType = null,
    Object? location = null,
    Object? rating = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            sportType: null == sportType
                ? _value.sportType
                : sportType // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VenueModelImplCopyWith<$Res>
    implements $VenueModelCopyWith<$Res> {
  factory _$$VenueModelImplCopyWith(
    _$VenueModelImpl value,
    $Res Function(_$VenueModelImpl) then,
  ) = __$$VenueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    String name,
    String image,
    @JsonKey(name: 'sport_type') String sportType,
    String location,
    double rating,
  });
}

/// @nodoc
class __$$VenueModelImplCopyWithImpl<$Res>
    extends _$VenueModelCopyWithImpl<$Res, _$VenueModelImpl>
    implements _$$VenueModelImplCopyWith<$Res> {
  __$$VenueModelImplCopyWithImpl(
    _$VenueModelImpl _value,
    $Res Function(_$VenueModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VenueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? sportType = null,
    Object? location = null,
    Object? rating = null,
  }) {
    return _then(
      _$VenueModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        sportType: null == sportType
            ? _value.sportType
            : sportType // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VenueModelImpl implements _VenueModel {
  const _$VenueModelImpl({
    @JsonKey(name: '_id') required this.id,
    required this.name,
    required this.image,
    @JsonKey(name: 'sport_type') required this.sportType,
    required this.location,
    required this.rating,
  });

  factory _$VenueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VenueModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String image;
  @override
  @JsonKey(name: 'sport_type')
  final String sportType;
  @override
  final String location;
  @override
  final double rating;

  @override
  String toString() {
    return 'VenueModel(id: $id, name: $name, image: $image, sportType: $sportType, location: $location, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VenueModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.sportType, sportType) ||
                other.sportType == sportType) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, image, sportType, location, rating);

  /// Create a copy of VenueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VenueModelImplCopyWith<_$VenueModelImpl> get copyWith =>
      __$$VenueModelImplCopyWithImpl<_$VenueModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VenueModelImplToJson(this);
  }
}

abstract class _VenueModel implements VenueModel {
  const factory _VenueModel({
    @JsonKey(name: '_id') required final String id,
    required final String name,
    required final String image,
    @JsonKey(name: 'sport_type') required final String sportType,
    required final String location,
    required final double rating,
  }) = _$VenueModelImpl;

  factory _VenueModel.fromJson(Map<String, dynamic> json) =
      _$VenueModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(name: 'sport_type')
  String get sportType;
  @override
  String get location;
  @override
  double get rating;

  /// Create a copy of VenueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VenueModelImplCopyWith<_$VenueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SlotModel _$SlotModelFromJson(Map<String, dynamic> json) {
  return _SlotModel.fromJson(json);
}

/// @nodoc
mixin _$SlotModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'venue_id')
  String get venueId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this SlotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SlotModelCopyWith<SlotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotModelCopyWith<$Res> {
  factory $SlotModelCopyWith(SlotModel value, $Res Function(SlotModel) then) =
      _$SlotModelCopyWithImpl<$Res, SlotModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'venue_id') String venueId,
    String date,
    String time,
    String status,
  });
}

/// @nodoc
class _$SlotModelCopyWithImpl<$Res, $Val extends SlotModel>
    implements $SlotModelCopyWith<$Res> {
  _$SlotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? venueId = null,
    Object? date = null,
    Object? time = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            venueId: null == venueId
                ? _value.venueId
                : venueId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SlotModelImplCopyWith<$Res>
    implements $SlotModelCopyWith<$Res> {
  factory _$$SlotModelImplCopyWith(
    _$SlotModelImpl value,
    $Res Function(_$SlotModelImpl) then,
  ) = __$$SlotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'venue_id') String venueId,
    String date,
    String time,
    String status,
  });
}

/// @nodoc
class __$$SlotModelImplCopyWithImpl<$Res>
    extends _$SlotModelCopyWithImpl<$Res, _$SlotModelImpl>
    implements _$$SlotModelImplCopyWith<$Res> {
  __$$SlotModelImplCopyWithImpl(
    _$SlotModelImpl _value,
    $Res Function(_$SlotModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SlotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? venueId = null,
    Object? date = null,
    Object? time = null,
    Object? status = null,
  }) {
    return _then(
      _$SlotModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        venueId: null == venueId
            ? _value.venueId
            : venueId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SlotModelImpl implements _SlotModel {
  const _$SlotModelImpl({
    @JsonKey(name: '_id') required this.id,
    @JsonKey(name: 'venue_id') required this.venueId,
    required this.date,
    required this.time,
    required this.status,
  });

  factory _$SlotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SlotModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'venue_id')
  final String venueId;
  @override
  final String date;
  @override
  final String time;
  @override
  final String status;

  @override
  String toString() {
    return 'SlotModel(id: $id, venueId: $venueId, date: $date, time: $time, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlotModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.venueId, venueId) || other.venueId == venueId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, venueId, date, time, status);

  /// Create a copy of SlotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SlotModelImplCopyWith<_$SlotModelImpl> get copyWith =>
      __$$SlotModelImplCopyWithImpl<_$SlotModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SlotModelImplToJson(this);
  }
}

abstract class _SlotModel implements SlotModel {
  const factory _SlotModel({
    @JsonKey(name: '_id') required final String id,
    @JsonKey(name: 'venue_id') required final String venueId,
    required final String date,
    required final String time,
    required final String status,
  }) = _$SlotModelImpl;

  factory _SlotModel.fromJson(Map<String, dynamic> json) =
      _$SlotModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'venue_id')
  String get venueId;
  @override
  String get date;
  @override
  String get time;
  @override
  String get status;

  /// Create a copy of SlotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SlotModelImplCopyWith<_$SlotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
