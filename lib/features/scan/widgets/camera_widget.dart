import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CameraWidget extends StatelessWidget {
  const CameraWidget({
    super.key,
    required this.controller,
    required this.onDetect,
    required this.tapToFocus,
  });

  final MobileScannerController controller;
  final void Function(BarcodeCapture) onDetect;
  final bool tapToFocus;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final shortestSide = math.min(
          constraints.maxWidth,
          constraints.maxHeight,
        );

        return Center(
          child: SizedBox(
            width: shortestSide,
            height: shortestSide,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: MobileScanner(
                controller: controller,
                onDetect: onDetect,
                tapToFocus: tapToFocus,
                scanWindow: Rect.fromCenter(
                  center: MediaQuery.sizeOf(
                    context,
                  ).center(const Offset(0, -100)),
                  width: shortestSide,
                  height: shortestSide,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
