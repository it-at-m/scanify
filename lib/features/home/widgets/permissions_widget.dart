import 'package:flutter/material.dart';
import 'package:flutter_application/core/widgets/card_widget.dart';
import 'package:flutter_application/features/home/bloc/home_cubit.dart';
import 'package:flutter_application/features/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsWidget extends StatefulWidget {
  const PermissionsWidget({super.key});

  @override
  State<PermissionsWidget> createState() => _PermissionsWidgetState();
}

class _PermissionsWidgetState extends State<PermissionsWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (mounted) {
        context.read<HomeCubit>().loadPermissions();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return CardWidget(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                title: Text('Permissions'),
                subtitle: Text('Manage app permissions.'),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                subtitle: Text(state.cameraStatus.uiLabel),
                trailing: TextButton(
                  onPressed: state.cameraStatus.isDenied
                      ? cubit.requestCameraPermission
                      : cubit.openSettings,
                  child: Text(
                    state.cameraStatus.isDenied ? 'Allow' : 'Settings',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

extension PermissionStatusUiX on PermissionStatus {
  String get uiLabel {
    switch (this) {
      case PermissionStatus.granted:
        return 'Granted';
      case PermissionStatus.denied:
        return 'Denied';
      case PermissionStatus.permanentlyDenied:
        return 'Permanently denied';
      case PermissionStatus.restricted:
        return 'Restricted';
      case PermissionStatus.limited:
        return 'Limited';
      case PermissionStatus.provisional:
        return 'Provisional';
    }
  }
}
