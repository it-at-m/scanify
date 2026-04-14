// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryState _$HistoryStateFromJson(Map<String, dynamic> json) =>
    _HistoryState(
      scans:
          (json['scans'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, ScanModel.fromJson(e as Map<String, dynamic>)),
          ) ??
          const <String, ScanModel>{},
      groups:
          (json['groups'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, GroupModel.fromJson(e as Map<String, dynamic>)),
          ) ??
          const <String, GroupModel>{},
      viewMode:
          $enumDecodeNullable(_$HistoryViewModeEnumMap, json['viewMode']) ??
          HistoryViewMode.last,
    );

Map<String, dynamic> _$HistoryStateToJson(_HistoryState instance) =>
    <String, dynamic>{
      'scans': instance.scans,
      'groups': instance.groups,
      'viewMode': _$HistoryViewModeEnumMap[instance.viewMode]!,
    };

const _$HistoryViewModeEnumMap = {
  HistoryViewMode.last: 'last',
  HistoryViewMode.custom: 'custom',
};
