// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryState {

 Map<String, ScanModel> get scans; Map<String, GroupModel> get groups; HistoryViewMode get viewMode;
/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryStateCopyWith<HistoryState> get copyWith => _$HistoryStateCopyWithImpl<HistoryState>(this as HistoryState, _$identity);

  /// Serializes this HistoryState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryState&&const DeepCollectionEquality().equals(other.scans, scans)&&const DeepCollectionEquality().equals(other.groups, groups)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(scans),const DeepCollectionEquality().hash(groups),viewMode);

@override
String toString() {
  return 'HistoryState(scans: $scans, groups: $groups, viewMode: $viewMode)';
}


}

/// @nodoc
abstract mixin class $HistoryStateCopyWith<$Res>  {
  factory $HistoryStateCopyWith(HistoryState value, $Res Function(HistoryState) _then) = _$HistoryStateCopyWithImpl;
@useResult
$Res call({
 Map<String, ScanModel> scans, Map<String, GroupModel> groups, HistoryViewMode viewMode
});




}
/// @nodoc
class _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._self, this._then);

  final HistoryState _self;
  final $Res Function(HistoryState) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scans = null,Object? groups = null,Object? viewMode = null,}) {
  return _then(_self.copyWith(
scans: null == scans ? _self.scans : scans // ignore: cast_nullable_to_non_nullable
as Map<String, ScanModel>,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as Map<String, GroupModel>,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as HistoryViewMode,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryState].
extension HistoryStatePatterns on HistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, ScanModel> scans,  Map<String, GroupModel> groups,  HistoryViewMode viewMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
return $default(_that.scans,_that.groups,_that.viewMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, ScanModel> scans,  Map<String, GroupModel> groups,  HistoryViewMode viewMode)  $default,) {final _that = this;
switch (_that) {
case _HistoryState():
return $default(_that.scans,_that.groups,_that.viewMode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, ScanModel> scans,  Map<String, GroupModel> groups,  HistoryViewMode viewMode)?  $default,) {final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
return $default(_that.scans,_that.groups,_that.viewMode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryState implements HistoryState {
  const _HistoryState({final  Map<String, ScanModel> scans = const <String, ScanModel>{}, final  Map<String, GroupModel> groups = const <String, GroupModel>{}, this.viewMode = HistoryViewMode.last}): _scans = scans,_groups = groups;
  factory _HistoryState.fromJson(Map<String, dynamic> json) => _$HistoryStateFromJson(json);

 final  Map<String, ScanModel> _scans;
@override@JsonKey() Map<String, ScanModel> get scans {
  if (_scans is EqualUnmodifiableMapView) return _scans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_scans);
}

 final  Map<String, GroupModel> _groups;
@override@JsonKey() Map<String, GroupModel> get groups {
  if (_groups is EqualUnmodifiableMapView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_groups);
}

@override@JsonKey() final  HistoryViewMode viewMode;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryStateCopyWith<_HistoryState> get copyWith => __$HistoryStateCopyWithImpl<_HistoryState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryState&&const DeepCollectionEquality().equals(other._scans, _scans)&&const DeepCollectionEquality().equals(other._groups, _groups)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_scans),const DeepCollectionEquality().hash(_groups),viewMode);

@override
String toString() {
  return 'HistoryState(scans: $scans, groups: $groups, viewMode: $viewMode)';
}


}

/// @nodoc
abstract mixin class _$HistoryStateCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory _$HistoryStateCopyWith(_HistoryState value, $Res Function(_HistoryState) _then) = __$HistoryStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, ScanModel> scans, Map<String, GroupModel> groups, HistoryViewMode viewMode
});




}
/// @nodoc
class __$HistoryStateCopyWithImpl<$Res>
    implements _$HistoryStateCopyWith<$Res> {
  __$HistoryStateCopyWithImpl(this._self, this._then);

  final _HistoryState _self;
  final $Res Function(_HistoryState) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scans = null,Object? groups = null,Object? viewMode = null,}) {
  return _then(_HistoryState(
scans: null == scans ? _self._scans : scans // ignore: cast_nullable_to_non_nullable
as Map<String, ScanModel>,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as Map<String, GroupModel>,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as HistoryViewMode,
  ));
}


}

// dart format on
