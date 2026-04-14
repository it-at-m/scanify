import 'package:flutter_application/features/history/bloc/history_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_application/features/history/models/group_model.dart';
import 'package:flutter_application/features/scan/models/scan_model.dart';

part 'history_group_mixin.dart';
part 'history_scan_mixin.dart';

enum HistoryViewMode { last, custom }

final _uuid = const Uuid();
final _dateFormat = DateFormat('yyyy-MM-dd');

String _generateId(String prefix) => '$prefix-${_uuid.v4()}';
String _formatDate(DateTime d) => _dateFormat.format(d);

class HistoryCubit extends HydratedCubit<HistoryState>
    with HistoryGroupMixin, HistoryScanMixin {
  HistoryCubit() : super(const HistoryState());

  @override
  HistoryState? fromJson(Map<String, dynamic> json) =>
      HistoryState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(HistoryState state) => state.toJson();

  void setViewMode(HistoryViewMode mode) {
    if (state.viewMode == mode) return;
    emit(state.copyWith(viewMode: mode));
  }
}
