import 'package:flutter/material.dart';
import 'package:flutter_application/features/scan/bloc/scan_state.dart';
import 'package:flutter_application/features/scan/widgets/camera_fab_widget.dart';
import 'package:flutter_application/features/scan/widgets/scan_result_widget.dart';
import 'package:flutter_application/core/widgets/card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:flutter_application/features/scan/bloc/scan_cubit.dart';
import 'package:flutter_application/features/scan/widgets/camera_widget.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  String _formatTime(DateTime? time) {
    if (time == null) return '--:--:--';
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return '${twoDigits(time.hour)}:${twoDigits(time.minute)}:${twoDigits(time.second)}';
  }

  @override
  Widget build(BuildContext context) {
    final scan = context.read<ScanCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Scan')),
      body: BlocConsumer<ScanCubit, ScanState>(
        listenWhen: ScanCubit.listenWhen,
        listener: (context, state) async {
          if (state is ScanDetected) {
            await Haptics.vibrate(HapticsType.success);
          } else if (state is ScanError) {
            await Haptics.vibrate(HapticsType.error);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 6),
                CardWidget(
                  child: ScanResultWidget(
                    text: state.displayText,
                    glow: state.showGlow,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatTime(state.timestamp),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontFeatures: [const FontFeature.tabularFigures()],
                        ),
                      ),
                      Text(
                        '${state.displayText.length}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                CardWidget(
                  child: state.cameraEnabled
                      ? CameraWidget(
                          key: ObjectKey(scan.controller),
                          controller: scan.controller,
                          onDetect: scan.onDetect,
                          tapToFocus: state.tapToFocus,
                        )
                      : const AspectRatio(
                          aspectRatio: 1,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: CameraFabWidget(controller: scan.controller),
    );
  }
}
