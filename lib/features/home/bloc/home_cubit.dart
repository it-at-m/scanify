import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial()) {
    loadPermissions();
  }

  Future<void> loadPermissions() async {
    final status = await Permission.camera.status;
    emit(state.copyWith(cameraStatus: status));
  }

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    emit(state.copyWith(cameraStatus: status));
  }

  Future<void> openSettings() async {
    await openAppSettings();
  }
}
