import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_model.freezed.dart';
part 'scan_model.g.dart';

@freezed
sealed class ScanModel with _$ScanModel {
  const factory ScanModel({
    required String id,
    required String content,
    required DateTime createdAt,
    String? format,
  }) = _ScanModel;

  factory ScanModel.fromJson(Map<String, dynamic> json) =>
      _$ScanModelFromJson(json);
}
