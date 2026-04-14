// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupModel {

 String get id; String get title; bool get isSystem; DateTime get createdAt; bool get noDuplicates; int? get minContentLength; int? get maxContentLength; int? get maxItems; List<String> get scanIds;
/// Create a copy of GroupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupModelCopyWith<GroupModel> get copyWith => _$GroupModelCopyWithImpl<GroupModel>(this as GroupModel, _$identity);

  /// Serializes this GroupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.noDuplicates, noDuplicates) || other.noDuplicates == noDuplicates)&&(identical(other.minContentLength, minContentLength) || other.minContentLength == minContentLength)&&(identical(other.maxContentLength, maxContentLength) || other.maxContentLength == maxContentLength)&&(identical(other.maxItems, maxItems) || other.maxItems == maxItems)&&const DeepCollectionEquality().equals(other.scanIds, scanIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isSystem,createdAt,noDuplicates,minContentLength,maxContentLength,maxItems,const DeepCollectionEquality().hash(scanIds));

@override
String toString() {
  return 'GroupModel(id: $id, title: $title, isSystem: $isSystem, createdAt: $createdAt, noDuplicates: $noDuplicates, minContentLength: $minContentLength, maxContentLength: $maxContentLength, maxItems: $maxItems, scanIds: $scanIds)';
}


}

/// @nodoc
abstract mixin class $GroupModelCopyWith<$Res>  {
  factory $GroupModelCopyWith(GroupModel value, $Res Function(GroupModel) _then) = _$GroupModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, bool isSystem, DateTime createdAt, bool noDuplicates, int? minContentLength, int? maxContentLength, int? maxItems, List<String> scanIds
});




}
/// @nodoc
class _$GroupModelCopyWithImpl<$Res>
    implements $GroupModelCopyWith<$Res> {
  _$GroupModelCopyWithImpl(this._self, this._then);

  final GroupModel _self;
  final $Res Function(GroupModel) _then;

/// Create a copy of GroupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isSystem = null,Object? createdAt = null,Object? noDuplicates = null,Object? minContentLength = freezed,Object? maxContentLength = freezed,Object? maxItems = freezed,Object? scanIds = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,noDuplicates: null == noDuplicates ? _self.noDuplicates : noDuplicates // ignore: cast_nullable_to_non_nullable
as bool,minContentLength: freezed == minContentLength ? _self.minContentLength : minContentLength // ignore: cast_nullable_to_non_nullable
as int?,maxContentLength: freezed == maxContentLength ? _self.maxContentLength : maxContentLength // ignore: cast_nullable_to_non_nullable
as int?,maxItems: freezed == maxItems ? _self.maxItems : maxItems // ignore: cast_nullable_to_non_nullable
as int?,scanIds: null == scanIds ? _self.scanIds : scanIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupModel].
extension GroupModelPatterns on GroupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupModel value)  $default,){
final _that = this;
switch (_that) {
case _GroupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupModel value)?  $default,){
final _that = this;
switch (_that) {
case _GroupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  bool isSystem,  DateTime createdAt,  bool noDuplicates,  int? minContentLength,  int? maxContentLength,  int? maxItems,  List<String> scanIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupModel() when $default != null:
return $default(_that.id,_that.title,_that.isSystem,_that.createdAt,_that.noDuplicates,_that.minContentLength,_that.maxContentLength,_that.maxItems,_that.scanIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  bool isSystem,  DateTime createdAt,  bool noDuplicates,  int? minContentLength,  int? maxContentLength,  int? maxItems,  List<String> scanIds)  $default,) {final _that = this;
switch (_that) {
case _GroupModel():
return $default(_that.id,_that.title,_that.isSystem,_that.createdAt,_that.noDuplicates,_that.minContentLength,_that.maxContentLength,_that.maxItems,_that.scanIds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  bool isSystem,  DateTime createdAt,  bool noDuplicates,  int? minContentLength,  int? maxContentLength,  int? maxItems,  List<String> scanIds)?  $default,) {final _that = this;
switch (_that) {
case _GroupModel() when $default != null:
return $default(_that.id,_that.title,_that.isSystem,_that.createdAt,_that.noDuplicates,_that.minContentLength,_that.maxContentLength,_that.maxItems,_that.scanIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GroupModel implements GroupModel {
  const _GroupModel({required this.id, required this.title, required this.isSystem, required this.createdAt, this.noDuplicates = false, this.minContentLength, this.maxContentLength, this.maxItems, final  List<String> scanIds = const <String>[]}): _scanIds = scanIds;
  factory _GroupModel.fromJson(Map<String, dynamic> json) => _$GroupModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  bool isSystem;
@override final  DateTime createdAt;
@override@JsonKey() final  bool noDuplicates;
@override final  int? minContentLength;
@override final  int? maxContentLength;
@override final  int? maxItems;
 final  List<String> _scanIds;
@override@JsonKey() List<String> get scanIds {
  if (_scanIds is EqualUnmodifiableListView) return _scanIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scanIds);
}


/// Create a copy of GroupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupModelCopyWith<_GroupModel> get copyWith => __$GroupModelCopyWithImpl<_GroupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.noDuplicates, noDuplicates) || other.noDuplicates == noDuplicates)&&(identical(other.minContentLength, minContentLength) || other.minContentLength == minContentLength)&&(identical(other.maxContentLength, maxContentLength) || other.maxContentLength == maxContentLength)&&(identical(other.maxItems, maxItems) || other.maxItems == maxItems)&&const DeepCollectionEquality().equals(other._scanIds, _scanIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isSystem,createdAt,noDuplicates,minContentLength,maxContentLength,maxItems,const DeepCollectionEquality().hash(_scanIds));

@override
String toString() {
  return 'GroupModel(id: $id, title: $title, isSystem: $isSystem, createdAt: $createdAt, noDuplicates: $noDuplicates, minContentLength: $minContentLength, maxContentLength: $maxContentLength, maxItems: $maxItems, scanIds: $scanIds)';
}


}

/// @nodoc
abstract mixin class _$GroupModelCopyWith<$Res> implements $GroupModelCopyWith<$Res> {
  factory _$GroupModelCopyWith(_GroupModel value, $Res Function(_GroupModel) _then) = __$GroupModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, bool isSystem, DateTime createdAt, bool noDuplicates, int? minContentLength, int? maxContentLength, int? maxItems, List<String> scanIds
});




}
/// @nodoc
class __$GroupModelCopyWithImpl<$Res>
    implements _$GroupModelCopyWith<$Res> {
  __$GroupModelCopyWithImpl(this._self, this._then);

  final _GroupModel _self;
  final $Res Function(_GroupModel) _then;

/// Create a copy of GroupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isSystem = null,Object? createdAt = null,Object? noDuplicates = null,Object? minContentLength = freezed,Object? maxContentLength = freezed,Object? maxItems = freezed,Object? scanIds = null,}) {
  return _then(_GroupModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,noDuplicates: null == noDuplicates ? _self.noDuplicates : noDuplicates // ignore: cast_nullable_to_non_nullable
as bool,minContentLength: freezed == minContentLength ? _self.minContentLength : minContentLength // ignore: cast_nullable_to_non_nullable
as int?,maxContentLength: freezed == maxContentLength ? _self.maxContentLength : maxContentLength // ignore: cast_nullable_to_non_nullable
as int?,maxItems: freezed == maxItems ? _self.maxItems : maxItems // ignore: cast_nullable_to_non_nullable
as int?,scanIds: null == scanIds ? _self._scanIds : scanIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
