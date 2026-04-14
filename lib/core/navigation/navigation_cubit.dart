import 'package:flutter_bloc/flutter_bloc.dart';

enum AppTab { home, scan, history, export }

class NavigationCubit extends Cubit<AppTab> {
  NavigationCubit() : super(AppTab.home);

  void setIndex(int i) {
    final safe = i.clamp(0, AppTab.values.length - 1);
    emit(AppTab.values[safe]);
  }
}
