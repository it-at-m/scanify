import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'scan_state.freezed.dart';
part 'scan_state.g.dart';

enum ScanFocusMode { auto, onlyOnTap }

@freezed
sealed class ScanState with _$ScanState {
  const ScanState._();

  const factory ScanState.idle({
    @Default(<String>{}) Set<String> selectedGroupIds,
    @Default(ScanFocusMode.auto) ScanFocusMode focusMode,
    @Default(<BarcodeFormat>{}) Set<BarcodeFormat> selectedFormats,
    @Default(true) bool cameraEnabled,
  }) = ScanIdle;

  const factory ScanState.detected({
    required String rawValue,
    required DateTime lastScanTime,
    @Default(<String>{}) Set<String> selectedGroupIds,
    @Default(ScanFocusMode.auto) ScanFocusMode focusMode,
    @Default(<BarcodeFormat>{}) Set<BarcodeFormat> selectedFormats,
    @Default(false) bool glow,
    @Default(true) bool cameraEnabled,
  }) = ScanDetected;

  const factory ScanState.error({
    required String message,
    @Default(<String>{}) Set<String> selectedGroupIds,
    @Default(ScanFocusMode.auto) ScanFocusMode focusMode,
    @Default(<BarcodeFormat>{}) Set<BarcodeFormat> selectedFormats,
    @Default(false) bool glow,
    @Default(true) bool cameraEnabled,
  }) = ScanError;

  factory ScanState.fromJson(Map<String, dynamic> json) =>
      _$ScanStateFromJson(json);

  String get displayText {
    return switch (this) {
      ScanDetected(rawValue: var t) => t,
      ScanError(message: var m) => m,
      _ => '',
    };
  }

  bool get showGlow {
    return switch (this) {
      ScanDetected(glow: var g) => g,
      _ => false,
    };
  }

  bool get tapToFocus => focusMode == ScanFocusMode.onlyOnTap;

  DateTime? get timestamp {
    return switch (this) {
      ScanDetected(lastScanTime: var t) => t,
      _ => null,
    };
  }
}
