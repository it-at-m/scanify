import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

@freezed
sealed class GroupModel with _$GroupModel {
  const factory GroupModel({
    required String id,
    required String title,
    required bool isSystem,
    required DateTime createdAt,

    @Default(false) bool noDuplicates,
    int? minContentLength,
    int? maxContentLength,
    int? maxItems,

    @Default(<String>[]) List<String> scanIds,
  }) = _GroupModel;

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
}
