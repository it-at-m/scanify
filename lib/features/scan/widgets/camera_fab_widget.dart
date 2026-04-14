import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application/features/scan/bloc/scan_cubit.dart';
import 'package:flutter_application/core/widgets/fab_widget.dart';
import 'package:flutter_application/features/scan/sheets/focus_selection_sheet.dart';
import 'package:flutter_application/features/scan/sheets/format_selection_sheet.dart';
import 'package:flutter_application/features/scan/sheets/group_selection_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CameraFabWidget extends StatelessWidget {
  const CameraFabWidget({super.key, required this.controller});

  final MobileScannerController controller;

  void _vibrate() => unawaited(Haptics.vibrate(HapticsType.selection));

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      type: ExpandableFabType.up,
      distance: 80,
      onOpen: _vibrate,
      onClose: _vibrate,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.menu),
        fabSize: ExpandableFabSize.regular,
        heroTag: 'scan-root-fab-open',
      ),
      closeButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.close),
        fabSize: ExpandableFabSize.regular,
        heroTag: 'scan-root-fab-close',
      ),
      children: [
        // Toggle Flashlight
        ValueListenableBuilder<MobileScannerState>(
          valueListenable: controller,
          builder: (context, camState, _) {
            final flashOn = camState.torchState == TorchState.on;
            return FabWidget(
              heroTag: 'scan-root-fab-flash',
              child: Icon(
                flashOn ? Icons.flashlight_on : Icons.flashlight_on_outlined,
              ),
              onPressed: () => context.read<ScanCubit>().toggleTorch(),
            );
          },
        ),

        // Select Groups
        FabWidget(
          heroTag: 'scan-root-fab-select-groups',
          child: const Icon(Icons.folder),
          onPressed: () async {
            final scanCubit = context.read<ScanCubit>();
            final newSelection = await GroupSelectionSheet.show(context);

            if (context.mounted && newSelection != null) {
              scanCubit.setSelectedGroups(newSelection);
            }
          },
        ),

        // Select Focus
        FabWidget(
          heroTag: 'scan-root-fab-select-focus',
          child: const Icon(Icons.filter_center_focus),
          onPressed: () async {
            final scanCubit = context.read<ScanCubit>();
            final newMode = await FocusSelectionSheet.show(
              context,
              currentMode: scanCubit.state.focusMode,
            );

            if (context.mounted && newMode != null) {
              scanCubit.setFocusMode(newMode);
            }
          },
        ),

        // Select Formats
        FabWidget(
          heroTag: 'scan-root-fab-select-format',
          child: const Icon(Icons.qr_code_scanner),
          onPressed: () async {
            final scanCubit = context.read<ScanCubit>();
            final newFormats = await FormatSelectionSheet.show(
              context,
              currentFormats: scanCubit.state.selectedFormats,
            );

            if (context.mounted && newFormats != null) {
              scanCubit.setSelectedFormats(newFormats);
            }
          },
        ),
      ],
    );
  }
}
