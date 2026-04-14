// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScanModel _$ScanModelFromJson(Map<String, dynamic> json) => _ScanModel(
  id: json['id'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  format: json['format'] as String?,
);

Map<String, dynamic> _$ScanModelToJson(_ScanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'format': instance.format,
    };
