part of 'history_cubit.dart';

mixin HistoryScanMixin on HydratedCubit<HistoryState> {
  String addScan({
    required String content,
    String? format,
    DateTime? createdAt,
  }) {
    final ts = createdAt ?? DateTime.now();

    final scanId = _generateId('scan');

    final scan = ScanModel(
      id: scanId,
      content: content,
      createdAt: ts,
      format: format,
    );

    final nextScans = {...state.scans, scanId: scan};
    final nextGroups = Map<String, GroupModel>.from(state.groups);

    final (todayId, toInsert) = _getOrCreateTodayGroup(
      state.copyWith(groups: nextGroups),
      ts,
    );

    if (toInsert != null) {
      nextGroups[todayId] = toInsert;
    }

    final updatedTodayGroup = _applyGroupRules(
      nextGroups[todayId]!,
      scan,
      nextScans,
    );

    if (updatedTodayGroup != null) {
      nextGroups[todayId] = updatedTodayGroup;
    }

    emit(state.copyWith(scans: nextScans, groups: nextGroups));
    return scanId;
  }

  bool addScanToGroup({required String groupId, required String scanId}) {
    final scan = state.scans[scanId];
    final group = state.groups[groupId];

    if (scan == null || group == null) return false;

    final updatedGroup = _applyGroupRules(group, scan, state.scans);

    if (updatedGroup == null) return false;

    emit(state.copyWith(groups: {...state.groups, groupId: updatedGroup}));
    return true;
  }

  void removeScansFromCurrentView(Iterable<String> potentialIds) {
    if (potentialIds.isEmpty) return;

    final idsInView = scanIdsForCurrentView().toSet();
    final toDelete = potentialIds.where((id) => idsInView.contains(id));

    removeScans(toDelete);
  }

  void removeScansFromGroup(String groupId, Iterable<String> scanIds) {
    final group = state.groups[groupId];
    if (group == null || scanIds.isEmpty) return;

    final idsToRemove = scanIds.toSet();

    final newScanIds = group.scanIds
        .where((id) => !idsToRemove.contains(id))
        .toList();

    final updatedGroup = group.copyWith(scanIds: newScanIds);
    emit(state.copyWith(groups: {...state.groups, groupId: updatedGroup}));
  }

  bool removeScanFromGroup({required String groupId, required String scanId}) {
    final g = state.groups[groupId];
    if (g == null || !g.scanIds.contains(scanId)) return false;

    final updated = g.copyWith(
      scanIds: List<String>.from(g.scanIds)..remove(scanId),
    );
    emit(state.copyWith(groups: {...state.groups, groupId: updated}));
    return true;
  }

  bool deleteScanEverywhere(String scanId) {
    if (!state.scans.containsKey(scanId)) return false;

    final nextScans = Map<String, ScanModel>.from(state.scans)..remove(scanId);

    final nextGroups = state.groups.map((key, group) {
      if (!group.scanIds.contains(scanId)) return MapEntry(key, group);

      return MapEntry(
        key,
        group.copyWith(
          scanIds: group.scanIds.where((id) => id != scanId).toList(),
        ),
      );
    });

    emit(state.copyWith(scans: nextScans, groups: nextGroups));
    return true;
  }

  void removeScans(Iterable<String> scanIds) {
    if (scanIds.isEmpty) return;
    final idsToRemove = scanIds.toSet();

    final nextScans = Map<String, ScanModel>.from(state.scans);
    nextScans.removeWhere((id, _) => idsToRemove.contains(id));

    final nextGroups = state.groups.map((groupId, group) {
      if (!group.scanIds.any(idsToRemove.contains)) {
        return MapEntry(groupId, group);
      }

      final newScanIds = group.scanIds
          .where((id) => !idsToRemove.contains(id))
          .toList();

      return MapEntry(groupId, group.copyWith(scanIds: newScanIds));
    });

    emit(state.copyWith(scans: nextScans, groups: nextGroups));
  }

  ScanModel? scanById(String id) => state.scans[id];

  GroupModel? _applyGroupRules(
    GroupModel group,
    ScanModel scan,
    Map<String, ScanModel> allScans,
  ) {
    // Length Check
    final len = scan.content.length;
    if (group.minContentLength != null && len < group.minContentLength!) {
      return null;
    }
    if (group.maxContentLength != null && len > group.maxContentLength!) {
      return null;
    }

    // Duplicate Check
    if (group.noDuplicates) {
      for (final sid in group.scanIds) {
        final s = allScans[sid];
        if (s != null && s.content == scan.content) return null;
      }
    }

    // List Size
    final ids = List<String>.from(group.scanIds)..add(scan.id);

    final max = group.maxItems;
    if (max != null && ids.length > max) {
      final overflow = ids.length - max;
      ids.removeRange(0, overflow);
    }

    return group.copyWith(scanIds: ids);
  }

  (String id, GroupModel? toInsert) _getOrCreateTodayGroup(
    HistoryState s,
    DateTime now,
  );

  Iterable<String> scanIdsForCurrentView() => state.scans.keys;
}
