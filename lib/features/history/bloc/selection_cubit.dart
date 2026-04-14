import 'package:flutter_bloc/flutter_bloc.dart';
import 'selection_state.dart';

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(const SelectionState());

  void toggleMode() =>
      emit(state.copyWith(enabled: !state.enabled, selected: {}));

  void clear() => emit(state.copyWith(selected: {}));

  void selectNone() => clear();

  void toggle(String id) {
    final isSelected = state.selected.contains(id);

    final next = {...state.selected};

    if (isSelected) {
      next.remove(id);
    } else {
      next.add(id);
    }

    emit(state.copyWith(selected: next));
  }

  void selectAll(Iterable<String> ids) =>
      emit(state.copyWith(selected: ids.toSet()));

  void enableWith(Iterable<String> ids) =>
      emit(SelectionState(enabled: true, selected: ids.toSet()));

  bool isAllSelected(Iterable<String> ids) {
    if (state.selected.length < ids.length) return false;
    return state.selected.containsAll(ids);
  }

  void toggleAll(Iterable<String> ids) {
    if (isAllSelected(ids)) {
      selectNone();
    } else {
      selectAll(ids);
    }
  }
}
