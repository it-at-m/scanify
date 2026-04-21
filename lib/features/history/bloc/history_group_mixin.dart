part of 'history_cubit.dart';

mixin HistoryGroupMixin on HydratedCubit<HistoryState> {
  String createGroup(
    String title, {
    bool noDuplicates = false,
    int? minContentLength,
    int? maxContentLength,
    int? maxItems,
  }) {
    final id = _generateId('group');
    final g = GroupModel(
      id: id,
      title: title,
      isSystem: false,
      createdAt: DateTime.now(),
      noDuplicates: noDuplicates,
      minContentLength: minContentLength,
      maxContentLength: maxContentLength,
      maxItems: maxItems,
    );
    emit(state.copyWith(groups: {...state.groups, id: g}));
    return id;
  }

  // ignore: unused_element
  (String id, GroupModel? toInsert) _getOrCreateTodayGroup(
    HistoryState s,
    DateTime now,
  ) {
    final title = _formatDate(now);
    try {
      final existing = s.groups.values.firstWhere(
        (g) => g.isSystem && g.title == title,
      );
      return (existing.id, null);
    } catch (_) {
      final id = _generateId('date');
      final group = GroupModel(
        id: id,
        title: title,
        isSystem: true,
        createdAt: now,
        noDuplicates: true,
      );
      return (id, group);
    }
  }

  bool updateGroup({
    required String id,
    required String title,
    required bool noDuplicates,
    int? minContentLength,
    int? maxContentLength,
    int? maxItems,
  }) {
    final g = state.groups[id];
    if (g == null) return false;

    final updated = GroupModel(
      id: g.id,
      createdAt: g.createdAt,
      isSystem: g.isSystem,
      scanIds: g.scanIds,
      title: title,
      noDuplicates: noDuplicates,
      minContentLength: minContentLength,
      maxContentLength: maxContentLength,
      maxItems: maxItems,
    );

    emit(state.copyWith(groups: {...state.groups, id: updated}));
    return true;
  }

  bool removeGroup(String groupId) {
    if (!state.groups.containsKey(groupId)) return false;
    removeGroups([groupId]);
    return true;
  }

  void removeGroupsFromCurrentView(Iterable<String> potentialIds) {
    if (potentialIds.isEmpty) return;

    final idsInView = groupIdsForCurrentView().toSet();
    final toDelete = potentialIds.where((id) => idsInView.contains(id));

    removeGroups(toDelete);
  }

  void removeGroups(Iterable<String> groupIds) {
    if (groupIds.isEmpty) return;

    final nextGroups = Map<String, GroupModel>.from(state.groups);

    for (final id in groupIds) {
      nextGroups.remove(id);
    }

    final referencedScanIds = <String>{};
    for (final group in nextGroups.values) {
      referencedScanIds.addAll(group.scanIds);
    }

    final nextScans = Map<String, ScanModel>.from(state.scans);
    nextScans.removeWhere((id, _) => !referencedScanIds.contains(id));

    emit(state.copyWith(groups: nextGroups, scans: nextScans));
  }

  Iterable<String> groupIdsForView(HistoryViewMode viewMode) {
    final groups = state.groups.values;
    return switch (viewMode) {
      HistoryViewMode.last => groups.where((g) => g.isSystem).map((g) => g.id),
      HistoryViewMode.custom =>
        groups.where((g) => !g.isSystem).map((g) => g.id),
    };
  }

  Iterable<String> groupIdsForCurrentView() => groupIdsForView(state.viewMode);

  GroupModel? groupById(String id) => state.groups[id];
}
