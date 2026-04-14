// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScanIdle _$ScanIdleFromJson(Map<String, dynamic> json) => ScanIdle(
  selectedGroupIds:
      (json['selectedGroupIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet() ??
      const <String>{},
  focusMode:
      $enumDecodeNullable(_$ScanFocusModeEnumMap, json['focusMode']) ??
      ScanFocusMode.auto,
  selectedFormats:
      (json['selectedFormats'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$BarcodeFormatEnumMap, e))
          .toSet() ??
      const <BarcodeFormat>{},
  cameraEnabled: json['cameraEnabled'] as bool? ?? true,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ScanIdleToJson(ScanIdle instance) => <String, dynamic>{
  'selectedGroupIds': instance.selectedGroupIds.toList(),
  'focusMode': _$ScanFocusModeEnumMap[instance.focusMode]!,
  'selectedFormats': instance.selectedFormats
      .map((e) => _$BarcodeFormatEnumMap[e]!)
      .toList(),
  'cameraEnabled': instance.cameraEnabled,
  'runtimeType': instance.$type,
};

const _$ScanFocusModeEnumMap = {
  ScanFocusMode.auto: 'auto',
  ScanFocusMode.onlyOnTap: 'onlyOnTap',
};

const _$BarcodeFormatEnumMap = {
  BarcodeFormat.unknown: 'unknown',
  BarcodeFormat.all: 'all',
  BarcodeFormat.code128: 'code128',
  BarcodeFormat.code39: 'code39',
  BarcodeFormat.code93: 'code93',
  BarcodeFormat.codabar: 'codabar',
  BarcodeFormat.dataMatrix: 'dataMatrix',
  BarcodeFormat.ean13: 'ean13',
  BarcodeFormat.ean8: 'ean8',
  BarcodeFormat.itf: 'itf',
  BarcodeFormat.qrCode: 'qrCode',
  BarcodeFormat.upcA: 'upcA',
  BarcodeFormat.upcE: 'upcE',
  BarcodeFormat.pdf417: 'pdf417',
  BarcodeFormat.aztec: 'aztec',
};

ScanDetected _$ScanDetectedFromJson(Map<String, dynamic> json) => ScanDetected(
  rawValue: json['rawValue'] as String,
  lastScanTime: DateTime.parse(json['lastScanTime'] as String),
  selectedGroupIds:
      (json['selectedGroupIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet() ??
      const <String>{},
  focusMode:
      $enumDecodeNullable(_$ScanFocusModeEnumMap, json['focusMode']) ??
      ScanFocusMode.auto,
  selectedFormats:
      (json['selectedFormats'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$BarcodeFormatEnumMap, e))
          .toSet() ??
      const <BarcodeFormat>{},
  glow: json['glow'] as bool? ?? false,
  cameraEnabled: json['cameraEnabled'] as bool? ?? true,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ScanDetectedToJson(ScanDetected instance) =>
    <String, dynamic>{
      'rawValue': instance.rawValue,
      'lastScanTime': instance.lastScanTime.toIso8601String(),
      'selectedGroupIds': instance.selectedGroupIds.toList(),
      'focusMode': _$ScanFocusModeEnumMap[instance.focusMode]!,
      'selectedFormats': instance.selectedFormats
          .map((e) => _$BarcodeFormatEnumMap[e]!)
          .toList(),
      'glow': instance.glow,
      'cameraEnabled': instance.cameraEnabled,
      'runtimeType': instance.$type,
    };

ScanError _$ScanErrorFromJson(Map<String, dynamic> json) => ScanError(
  message: json['message'] as String,
  selectedGroupIds:
      (json['selectedGroupIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet() ??
      const <String>{},
  focusMode:
      $enumDecodeNullable(_$ScanFocusModeEnumMap, json['focusMode']) ??
      ScanFocusMode.auto,
  selectedFormats:
      (json['selectedFormats'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$BarcodeFormatEnumMap, e))
          .toSet() ??
      const <BarcodeFormat>{},
  glow: json['glow'] as bool? ?? false,
  cameraEnabled: json['cameraEnabled'] as bool? ?? true,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ScanErrorToJson(ScanError instance) => <String, dynamic>{
  'message': instance.message,
  'selectedGroupIds': instance.selectedGroupIds.toList(),
  'focusMode': _$ScanFocusModeEnumMap[instance.focusMode]!,
  'selectedFormats': instance.selectedFormats
      .map((e) => _$BarcodeFormatEnumMap[e]!)
      .toList(),
  'glow': instance.glow,
  'cameraEnabled': instance.cameraEnabled,
  'runtimeType': instance.$type,
};
