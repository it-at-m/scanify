import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class FabWidget extends StatelessWidget {
  const FabWidget({
    super.key,
    required this.heroTag,
    required this.onPressed,
    required this.child,
    this.enableHaptics = true,
  });

  final String heroTag;
  final VoidCallback onPressed;
  final Widget child;
  final bool enableHaptics;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        if (enableHaptics) {
          unawaited(Haptics.vibrate(HapticsType.selection));
        }
        onPressed();
      },
      child: child,
    );
  }
}
