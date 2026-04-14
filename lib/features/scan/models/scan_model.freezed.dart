// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScanModel {

 String get id; String get content; DateTime get createdAt; String? get format;
/// Create a copy of ScanModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanModelCopyWith<ScanModel> get copyWith => _$ScanModelCopyWithImpl<ScanModel>(this as ScanModel, _$identity);

  /// Serializes this ScanModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.format, format) || other.format == format));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,createdAt,format);

@override
String toString() {
  return 'ScanModel(id: $id, content: $content, createdAt: $createdAt, format: $format)';
}


}

/// @nodoc
abstract mixin class $ScanModelCopyWith<$Res>  {
  factory $ScanModelCopyWith(ScanModel value, $Res Function(ScanModel) _then) = _$ScanModelCopyWithImpl;
@useResult
$Res call({
 String id, String content, DateTime createdAt, String? format
});




}
/// @nodoc
class _$ScanModelCopyWithImpl<$Res>
    implements $ScanModelCopyWith<$Res> {
  _$ScanModelCopyWithImpl(this._self, this._then);

  final ScanModel _self;
  final $Res Function(ScanModel) _then;

/// Create a copy of ScanModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,Object? createdAt = null,Object? format = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScanModel].
extension ScanModelPatterns on ScanModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanModel value)  $default,){
final _that = this;
switch (_that) {
case _ScanModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanModel value)?  $default,){
final _that = this;
switch (_that) {
case _ScanModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String content,  DateTime createdAt,  String? format)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanModel() when $default != null:
return $default(_that.id,_that.content,_that.createdAt,_that.format);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String content,  DateTime createdAt,  String? format)  $default,) {final _that = this;
switch (_that) {
case _ScanModel():
return $default(_that.id,_that.content,_that.createdAt,_that.format);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String content,  DateTime createdAt,  String? format)?  $default,) {final _that = this;
switch (_that) {
case _ScanModel() when $default != null:
return $default(_that.id,_that.content,_that.createdAt,_that.format);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScanModel implements ScanModel {
  const _ScanModel({required this.id, required this.content, required this.createdAt, this.format});
  factory _ScanModel.fromJson(Map<String, dynamic> json) => _$ScanModelFromJson(json);

@override final  String id;
@override final  String content;
@override final  DateTime createdAt;
@override final  String? format;

/// Create a copy of ScanModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanModelCopyWith<_ScanModel> get copyWith => __$ScanModelCopyWithImpl<_ScanModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScanModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.format, format) || other.format == format));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,content,createdAt,format);

@override
String toString() {
  return 'ScanModel(id: $id, content: $content, createdAt: $createdAt, format: $format)';
}


}

/// @nodoc
abstract mixin class _$ScanModelCopyWith<$Res> implements $ScanModelCopyWith<$Res> {
  factory _$ScanModelCopyWith(_ScanModel value, $Res Function(_ScanModel) _then) = __$ScanModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String content, DateTime createdAt, String? format
});




}
/// @nodoc
class __$ScanModelCopyWithImpl<$Res>
    implements _$ScanModelCopyWith<$Res> {
  __$ScanModelCopyWithImpl(this._self, this._then);

  final _ScanModel _self;
  final $Res Function(_ScanModel) _then;

/// Create a copy of ScanModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,Object? createdAt = null,Object? format = freezed,}) {
  return _then(_ScanModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
