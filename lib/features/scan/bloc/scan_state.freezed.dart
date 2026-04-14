// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ScanState _$ScanStateFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'idle':
          return ScanIdle.fromJson(
            json
          );
                case 'detected':
          return ScanDetected.fromJson(
            json
          );
                case 'error':
          return ScanError.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ScanState',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ScanState {

 Set<String> get selectedGroupIds; ScanFocusMode get focusMode; Set<BarcodeFormat> get selectedFormats; bool get cameraEnabled;
/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanStateCopyWith<ScanState> get copyWith => _$ScanStateCopyWithImpl<ScanState>(this as ScanState, _$identity);

  /// Serializes this ScanState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanState&&const DeepCollectionEquality().equals(other.selectedGroupIds, selectedGroupIds)&&(identical(other.focusMode, focusMode) || other.focusMode == focusMode)&&const DeepCollectionEquality().equals(other.selectedFormats, selectedFormats)&&(identical(other.cameraEnabled, cameraEnabled) || other.cameraEnabled == cameraEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selectedGroupIds),focusMode,const DeepCollectionEquality().hash(selectedFormats),cameraEnabled);

@override
String toString() {
  return 'ScanState(selectedGroupIds: $selectedGroupIds, focusMode: $focusMode, selectedFormats: $selectedFormats, cameraEnabled: $cameraEnabled)';
}


}

/// @nodoc
abstract mixin class $ScanStateCopyWith<$Res>  {
  factory $ScanStateCopyWith(ScanState value, $Res Function(ScanState) _then) = _$ScanStateCopyWithImpl;
@useResult
$Res call({
 Set<String> selectedGroupIds, ScanFocusMode focusMode, Set<BarcodeFormat> selectedFormats, bool cameraEnabled
});




}
/// @nodoc
class _$ScanStateCopyWithImpl<$Res>
    implements $ScanStateCopyWith<$Res> {
  _$ScanStateCopyWithImpl(this._self, this._then);

  final ScanState _self;
  final $Res Function(ScanState) _then;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedGroupIds = null,Object? focusMode = null,Object? selectedFormats = null,Object? cameraEnabled = null,}) {
  return _then(_self.copyWith(
selectedGroupIds: null == selectedGroupIds ? _self.selectedGroupIds : selectedGroupIds // ignore: cast_nullable_to_non_nullable
as Set<String>,focusMode: null == focusMode ? _self.focusMode : focusMode // ignore: cast_nullable_to_non_nullable
as ScanFocusMode,selectedFormats: null == selectedFormats ? _self.selectedFormats : selectedFormats // ignore: cast_nullable_to_non_nullable
as Set<BarcodeFormat>,cameraEnabled: null == cameraEnabled ? _self.cameraEnabled : cameraEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ScanState].
extension ScanStatePatterns on ScanState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ScanIdle value)?  idle,TResult Function( ScanDetected value)?  detected,TResult Function( ScanError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ScanIdle() when idle != null:
return idle(_that);case ScanDetected() when detected != null:
return detected(_that);case ScanError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ScanIdle value)  idle,required TResult Function( ScanDetected value)  detected,required TResult Function( ScanError value)  error,}){
final _that = this;
switch (_that) {
case ScanIdle():
return idle(_that);case ScanDetected():
return detected(_that);case ScanError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ScanIdle value)?  idle,TResult? Function( ScanDetected value)?  detected,TResult? Function( ScanError value)?  error,}){
final _that = this;
switch (_that) {
case ScanIdle() when idle != null:
return idle(_that);case ScanDetected() when detected != null:
return detected(_that);case ScanError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Set<String> selectedGroupIds,  ScanFocusMode focusMode,  Set<BarcodeFormat> selectedFormats,  bool cameraEnabled)?  idle,TResult Function( String rawValue,  DateTime lastScanTime,  Set<String> selectedGroupIds,  ScanFocusMode focusMode,  Set<BarcodeFormat> selectedFormats,  bool glow,  bool cameraEnabled)?  detected,TResult Function( String message,  Set<String> selectedGroupIds,  ScanFocusMode focusMode,  Set<BarcodeFormat> selectedFormats,  bool glow,  bool cameraEnabled)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ScanIdle() when idle != null:
return idle(_that.selectedGroupIds,_that.focusMode,_that.selectedFormats,_that.cameraEnabled);case ScanDetected() when detected != null:
return detected(_that.rawValue,_that.lastScanTime,_that.selectedGroupIds,_that.focusMode,_that.selectedFormats,_that.glow,_that.cameraEnabled);case ScanError() when error != null:
return error(_that.message,_that.selectedGroupIds,_that.focusMode,_that.selectedFormats,_that.glow,_that.cameraEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Set<String> selectedGroupIds,  ScanFocusMode focusMode,  Set<BarcodeFormat> selectedFormats,  bool cameraEnabled)  idle,required TResult Function( String rawValue,  DateTime lastScanTime,  Set<String> selectedGroupIds,  ScanFocusMode focusMode,  Set<BarcodeFormat> selectedFormats,  bool glow,  bool cameraEnabled)  detected,required TResult Function( String message,  Set<String> selectedGroupIds,  ScanFocusMode focusMode,  Set<BarcodeFormat> selectedFormats,  bool glow,  bool cameraEnabled)  error,}) {final _that = this;
switch (_that) {
case ScanIdle():
return idle(_that.selectedGroupIds,_that.focusMode,_that.selectedFormats,_that.cameraEnabled);case ScanDetected():
return detected(_that.rawValue,_that.lastScanTime,_that.selectedGroupIds,_that.focusMode,_that.selectedFormats,_that.glow,_that.cameraEnabled);case ScanError():
return error(_that.message,_that.selectedGroupIds,_that.focusMode,_that.selectedFormats,_that.glow,_that.cameraEnabled);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Set<String> selectedGroupIds,  ScanFocusMode focusMode,  Set<BarcodeFormat> selectedFormats,  bool cameraEnabled)?  idle,TResult? Function( String rawValue,  DateTime lastScanTime,  Set<String> selectedGroupIds,  ScanFocusMode focusMode,  Set<BarcodeFormat> selectedFormats,  bool glow,  bool cameraEnabled)?  detected,TResult? Function( String message,  Set<String> selectedGroupIds,  ScanFocusMode focusMode,  Set<BarcodeFormat> selectedFormats,  bool glow,  bool cameraEnabled)?  error,}) {final _that = this;
switch (_that) {
case ScanIdle() when idle != null:
return idle(_that.selectedGroupIds,_that.focusMode,_that.selectedFormats,_that.cameraEnabled);case ScanDetected() when detected != null:
return detected(_that.rawValue,_that.lastScanTime,_that.selectedGroupIds,_that.focusMode,_that.selectedFormats,_that.glow,_that.cameraEnabled);case ScanError() when error != null:
return error(_that.message,_that.selectedGroupIds,_that.focusMode,_that.selectedFormats,_that.glow,_that.cameraEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ScanIdle extends ScanState {
  const ScanIdle({final  Set<String> selectedGroupIds = const <String>{}, this.focusMode = ScanFocusMode.auto, final  Set<BarcodeFormat> selectedFormats = const <BarcodeFormat>{}, this.cameraEnabled = true, final  String? $type}): _selectedGroupIds = selectedGroupIds,_selectedFormats = selectedFormats,$type = $type ?? 'idle',super._();
  factory ScanIdle.fromJson(Map<String, dynamic> json) => _$ScanIdleFromJson(json);

 final  Set<String> _selectedGroupIds;
@override@JsonKey() Set<String> get selectedGroupIds {
  if (_selectedGroupIds is EqualUnmodifiableSetView) return _selectedGroupIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedGroupIds);
}

@override@JsonKey() final  ScanFocusMode focusMode;
 final  Set<BarcodeFormat> _selectedFormats;
@override@JsonKey() Set<BarcodeFormat> get selectedFormats {
  if (_selectedFormats is EqualUnmodifiableSetView) return _selectedFormats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedFormats);
}

@override@JsonKey() final  bool cameraEnabled;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanIdleCopyWith<ScanIdle> get copyWith => _$ScanIdleCopyWithImpl<ScanIdle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScanIdleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanIdle&&const DeepCollectionEquality().equals(other._selectedGroupIds, _selectedGroupIds)&&(identical(other.focusMode, focusMode) || other.focusMode == focusMode)&&const DeepCollectionEquality().equals(other._selectedFormats, _selectedFormats)&&(identical(other.cameraEnabled, cameraEnabled) || other.cameraEnabled == cameraEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectedGroupIds),focusMode,const DeepCollectionEquality().hash(_selectedFormats),cameraEnabled);

@override
String toString() {
  return 'ScanState.idle(selectedGroupIds: $selectedGroupIds, focusMode: $focusMode, selectedFormats: $selectedFormats, cameraEnabled: $cameraEnabled)';
}


}

/// @nodoc
abstract mixin class $ScanIdleCopyWith<$Res> implements $ScanStateCopyWith<$Res> {
  factory $ScanIdleCopyWith(ScanIdle value, $Res Function(ScanIdle) _then) = _$ScanIdleCopyWithImpl;
@override @useResult
$Res call({
 Set<String> selectedGroupIds, ScanFocusMode focusMode, Set<BarcodeFormat> selectedFormats, bool cameraEnabled
});




}
/// @nodoc
class _$ScanIdleCopyWithImpl<$Res>
    implements $ScanIdleCopyWith<$Res> {
  _$ScanIdleCopyWithImpl(this._self, this._then);

  final ScanIdle _self;
  final $Res Function(ScanIdle) _then;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedGroupIds = null,Object? focusMode = null,Object? selectedFormats = null,Object? cameraEnabled = null,}) {
  return _then(ScanIdle(
selectedGroupIds: null == selectedGroupIds ? _self._selectedGroupIds : selectedGroupIds // ignore: cast_nullable_to_non_nullable
as Set<String>,focusMode: null == focusMode ? _self.focusMode : focusMode // ignore: cast_nullable_to_non_nullable
as ScanFocusMode,selectedFormats: null == selectedFormats ? _self._selectedFormats : selectedFormats // ignore: cast_nullable_to_non_nullable
as Set<BarcodeFormat>,cameraEnabled: null == cameraEnabled ? _self.cameraEnabled : cameraEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ScanDetected extends ScanState {
  const ScanDetected({required this.rawValue, required this.lastScanTime, final  Set<String> selectedGroupIds = const <String>{}, this.focusMode = ScanFocusMode.auto, final  Set<BarcodeFormat> selectedFormats = const <BarcodeFormat>{}, this.glow = false, this.cameraEnabled = true, final  String? $type}): _selectedGroupIds = selectedGroupIds,_selectedFormats = selectedFormats,$type = $type ?? 'detected',super._();
  factory ScanDetected.fromJson(Map<String, dynamic> json) => _$ScanDetectedFromJson(json);

 final  String rawValue;
 final  DateTime lastScanTime;
 final  Set<String> _selectedGroupIds;
@override@JsonKey() Set<String> get selectedGroupIds {
  if (_selectedGroupIds is EqualUnmodifiableSetView) return _selectedGroupIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedGroupIds);
}

@override@JsonKey() final  ScanFocusMode focusMode;
 final  Set<BarcodeFormat> _selectedFormats;
@override@JsonKey() Set<BarcodeFormat> get selectedFormats {
  if (_selectedFormats is EqualUnmodifiableSetView) return _selectedFormats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedFormats);
}

@JsonKey() final  bool glow;
@override@JsonKey() final  bool cameraEnabled;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanDetectedCopyWith<ScanDetected> get copyWith => _$ScanDetectedCopyWithImpl<ScanDetected>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScanDetectedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanDetected&&(identical(other.rawValue, rawValue) || other.rawValue == rawValue)&&(identical(other.lastScanTime, lastScanTime) || other.lastScanTime == lastScanTime)&&const DeepCollectionEquality().equals(other._selectedGroupIds, _selectedGroupIds)&&(identical(other.focusMode, focusMode) || other.focusMode == focusMode)&&const DeepCollectionEquality().equals(other._selectedFormats, _selectedFormats)&&(identical(other.glow, glow) || other.glow == glow)&&(identical(other.cameraEnabled, cameraEnabled) || other.cameraEnabled == cameraEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rawValue,lastScanTime,const DeepCollectionEquality().hash(_selectedGroupIds),focusMode,const DeepCollectionEquality().hash(_selectedFormats),glow,cameraEnabled);

@override
String toString() {
  return 'ScanState.detected(rawValue: $rawValue, lastScanTime: $lastScanTime, selectedGroupIds: $selectedGroupIds, focusMode: $focusMode, selectedFormats: $selectedFormats, glow: $glow, cameraEnabled: $cameraEnabled)';
}


}

/// @nodoc
abstract mixin class $ScanDetectedCopyWith<$Res> implements $ScanStateCopyWith<$Res> {
  factory $ScanDetectedCopyWith(ScanDetected value, $Res Function(ScanDetected) _then) = _$ScanDetectedCopyWithImpl;
@override @useResult
$Res call({
 String rawValue, DateTime lastScanTime, Set<String> selectedGroupIds, ScanFocusMode focusMode, Set<BarcodeFormat> selectedFormats, bool glow, bool cameraEnabled
});




}
/// @nodoc
class _$ScanDetectedCopyWithImpl<$Res>
    implements $ScanDetectedCopyWith<$Res> {
  _$ScanDetectedCopyWithImpl(this._self, this._then);

  final ScanDetected _self;
  final $Res Function(ScanDetected) _then;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rawValue = null,Object? lastScanTime = null,Object? selectedGroupIds = null,Object? focusMode = null,Object? selectedFormats = null,Object? glow = null,Object? cameraEnabled = null,}) {
  return _then(ScanDetected(
rawValue: null == rawValue ? _self.rawValue : rawValue // ignore: cast_nullable_to_non_nullable
as String,lastScanTime: null == lastScanTime ? _self.lastScanTime : lastScanTime // ignore: cast_nullable_to_non_nullable
as DateTime,selectedGroupIds: null == selectedGroupIds ? _self._selectedGroupIds : selectedGroupIds // ignore: cast_nullable_to_non_nullable
as Set<String>,focusMode: null == focusMode ? _self.focusMode : focusMode // ignore: cast_nullable_to_non_nullable
as ScanFocusMode,selectedFormats: null == selectedFormats ? _self._selectedFormats : selectedFormats // ignore: cast_nullable_to_non_nullable
as Set<BarcodeFormat>,glow: null == glow ? _self.glow : glow // ignore: cast_nullable_to_non_nullable
as bool,cameraEnabled: null == cameraEnabled ? _self.cameraEnabled : cameraEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ScanError extends ScanState {
  const ScanError({required this.message, final  Set<String> selectedGroupIds = const <String>{}, this.focusMode = ScanFocusMode.auto, final  Set<BarcodeFormat> selectedFormats = const <BarcodeFormat>{}, this.glow = false, this.cameraEnabled = true, final  String? $type}): _selectedGroupIds = selectedGroupIds,_selectedFormats = selectedFormats,$type = $type ?? 'error',super._();
  factory ScanError.fromJson(Map<String, dynamic> json) => _$ScanErrorFromJson(json);

 final  String message;
 final  Set<String> _selectedGroupIds;
@override@JsonKey() Set<String> get selectedGroupIds {
  if (_selectedGroupIds is EqualUnmodifiableSetView) return _selectedGroupIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedGroupIds);
}

@override@JsonKey() final  ScanFocusMode focusMode;
 final  Set<BarcodeFormat> _selectedFormats;
@override@JsonKey() Set<BarcodeFormat> get selectedFormats {
  if (_selectedFormats is EqualUnmodifiableSetView) return _selectedFormats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedFormats);
}

@JsonKey() final  bool glow;
@override@JsonKey() final  bool cameraEnabled;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanErrorCopyWith<ScanError> get copyWith => _$ScanErrorCopyWithImpl<ScanError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScanErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanError&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._selectedGroupIds, _selectedGroupIds)&&(identical(other.focusMode, focusMode) || other.focusMode == focusMode)&&const DeepCollectionEquality().equals(other._selectedFormats, _selectedFormats)&&(identical(other.glow, glow) || other.glow == glow)&&(identical(other.cameraEnabled, cameraEnabled) || other.cameraEnabled == cameraEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_selectedGroupIds),focusMode,const DeepCollectionEquality().hash(_selectedFormats),glow,cameraEnabled);

@override
String toString() {
  return 'ScanState.error(message: $message, selectedGroupIds: $selectedGroupIds, focusMode: $focusMode, selectedFormats: $selectedFormats, glow: $glow, cameraEnabled: $cameraEnabled)';
}


}

/// @nodoc
abstract mixin class $ScanErrorCopyWith<$Res> implements $ScanStateCopyWith<$Res> {
  factory $ScanErrorCopyWith(ScanError value, $Res Function(ScanError) _then) = _$ScanErrorCopyWithImpl;
@override @useResult
$Res call({
 String message, Set<String> selectedGroupIds, ScanFocusMode focusMode, Set<BarcodeFormat> selectedFormats, bool glow, bool cameraEnabled
});




}
/// @nodoc
class _$ScanErrorCopyWithImpl<$Res>
    implements $ScanErrorCopyWith<$Res> {
  _$ScanErrorCopyWithImpl(this._self, this._then);

  final ScanError _self;
  final $Res Function(ScanError) _then;

/// Create a copy of ScanState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? selectedGroupIds = null,Object? focusMode = null,Object? selectedFormats = null,Object? glow = null,Object? cameraEnabled = null,}) {
  return _then(ScanError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,selectedGroupIds: null == selectedGroupIds ? _self._selectedGroupIds : selectedGroupIds // ignore: cast_nullable_to_non_nullable
as Set<String>,focusMode: null == focusMode ? _self.focusMode : focusMode // ignore: cast_nullable_to_non_nullable
as ScanFocusMode,selectedFormats: null == selectedFormats ? _self._selectedFormats : selectedFormats // ignore: cast_nullable_to_non_nullable
as Set<BarcodeFormat>,glow: null == glow ? _self.glow : glow // ignore: cast_nullable_to_non_nullable
as bool,cameraEnabled: null == cameraEnabled ? _self.cameraEnabled : cameraEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
