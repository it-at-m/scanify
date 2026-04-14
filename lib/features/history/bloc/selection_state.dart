class SelectionState {
  const SelectionState({this.enabled = false, this.selected = const {}});
  final bool enabled;
  final Set<String> selected;

  SelectionState copyWith({bool? enabled, Set<String>? selected}) =>
      SelectionState(
        enabled: enabled ?? this.enabled,
        selected: selected ?? this.selected,
      );
}
