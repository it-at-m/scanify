import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeState extends Equatable {
  final PermissionStatus cameraStatus;
  final bool isLoadingPermissions;

  const HomeState({
    required this.cameraStatus,
    required this.isLoadingPermissions,
  });

  factory HomeState.initial() => const HomeState(
    cameraStatus: PermissionStatus.denied,
    isLoadingPermissions: false,
  );

  HomeState copyWith({
    PermissionStatus? cameraStatus,
    bool? isLoadingPermissions,
  }) {
    return HomeState(
      cameraStatus: cameraStatus ?? this.cameraStatus,
      isLoadingPermissions: isLoadingPermissions ?? this.isLoadingPermissions,
    );
  }

  @override
  List<Object?> get props => [cameraStatus, isLoadingPermissions];
}
