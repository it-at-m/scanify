// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupModel _$GroupModelFromJson(Map<String, dynamic> json) => _GroupModel(
  id: json['id'] as String,
  title: json['title'] as String,
  isSystem: json['isSystem'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  noDuplicates: json['noDuplicates'] as bool? ?? false,
  minContentLength: (json['minContentLength'] as num?)?.toInt(),
  maxContentLength: (json['maxContentLength'] as num?)?.toInt(),
  maxItems: (json['maxItems'] as num?)?.toInt(),
  scanIds:
      (json['scanIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$GroupModelToJson(_GroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isSystem': instance.isSystem,
      'createdAt': instance.createdAt.toIso8601String(),
      'noDuplicates': instance.noDuplicates,
      'minContentLength': instance.minContentLength,
      'maxContentLength': instance.maxContentLength,
      'maxItems': instance.maxItems,
      'scanIds': instance.scanIds,
    };
