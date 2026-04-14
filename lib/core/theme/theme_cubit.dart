import 'package:flutter_bloc/flutter_bloc.dart';

enum AppThemeMode { system, light, dark }

class ThemeState {
  final AppThemeMode mode;
  const ThemeState(this.mode);
}

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(AppThemeMode.system));
  void setMode(AppThemeMode mode) => emit(ThemeState(mode));
}
