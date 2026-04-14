import 'dart:async';

import 'package:flutter_application/features/history/bloc/history_cubit.dart';
import 'package:flutter_application/features/scan/bloc/scan_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanCubit extends HydratedCubit<ScanState> {
  final HistoryCubit history;
  final Duration scanDelay;

  late MobileScannerController _controller;
  MobileScannerController get controller => _controller;

  bool _cooldown = false;
  Timer? _glowTimer;

  ScanCubit({
    required this.history,
    this.scanDelay = const Duration(milliseconds: 400),
  }) : super(const ScanState.idle()) {
    final formatsList = state.selectedFormats.isEmpty
        ? const [BarcodeFormat.all]
        : state.selectedFormats.toList();

    _controller = MobileScannerController(
      formats: formatsList,
      autoStart: false,
    );
  }

  static bool listenWhen(ScanState previous, ScanState current) {
    if (current is ScanDetected) {
      return previous is! ScanDetected || previous.rawValue != current.rawValue;
    }
    if (current is ScanError) {
      return previous is! ScanError || previous.message != current.message;
    }
    return false;
  }

  Future<void> start() async {
    await _controller.start();
  }

  Future<void> stop() async {
    await _controller.stop();
  }

  Future<void> toggleTorch() => _controller.toggleTorch();

  void setSelectedGroups(Set<String> groupIds) {
    emit(state.copyWith(selectedGroupIds: Set<String>.from(groupIds)));
  }

  Future<void> setFocusMode(ScanFocusMode mode) async {
    emit(state.copyWith(cameraEnabled: false, focusMode: mode));

    final formatsList = state.selectedFormats.isEmpty
        ? const [BarcodeFormat.all]
        : state.selectedFormats.toList();

    await _reloadControllerWithFormats(formatsList);

    emit(state.copyWith(cameraEnabled: true));
  }

  Future<void> setSelectedFormats(Set<BarcodeFormat> formats) async {
    final selected = Set<BarcodeFormat>.from(formats);
    final formatsList = selected.isEmpty
        ? const [BarcodeFormat.all]
        : selected.toList();

    emit(state.copyWith(cameraEnabled: false, selectedFormats: selected));

    await _reloadControllerWithFormats(formatsList);

    emit(state.copyWith(cameraEnabled: true));
  }

  Future<void> _reloadControllerWithFormats(List<BarcodeFormat> formats) async {
    final old = _controller;
    try {
      await old.stop();
    } catch (_) {}
    unawaited(old.dispose());

    _controller = MobileScannerController(formats: formats);
  }

  Future<void> onDetect(BarcodeCapture capture) async {
    if (_cooldown) return;

    final first = capture.barcodes.firstOrNull;
    final content = first?.rawValue;
    if (first == null || content == null || content.isEmpty) return;

    try {
      final now = DateTime.now();

      final scanId = history.addScan(
        content: content,
        format: first.format.name,
        createdAt: now,
      );

      for (final groupId in state.selectedGroupIds) {
        history.addScanToGroup(groupId: groupId, scanId: scanId);
      }

      emit(
        ScanState.detected(
          rawValue: content,
          lastScanTime: now,
          selectedGroupIds: state.selectedGroupIds,
          focusMode: state.focusMode,
          selectedFormats: state.selectedFormats,
          glow: true,
          cameraEnabled: state.cameraEnabled,
        ),
      );

      _cooldown = true;
      unawaited(
        Future<void>.delayed(scanDelay).then((_) {
          _cooldown = false;
        }),
      );

      _glowTimer?.cancel();
      _glowTimer = Timer(const Duration(seconds: 1), () {
        if (!isClosed) {
          final s = state;
          if (s is ScanDetected && s.rawValue == content && s.glow) {
            emit(s.copyWith(glow: false));
          }
        }
      });
    } catch (_) {
      emit(
        ScanState.error(
          message: 'Scan failed',
          selectedGroupIds: state.selectedGroupIds,
          focusMode: state.focusMode,
          selectedFormats: state.selectedFormats,
          glow: false,
          cameraEnabled: state.cameraEnabled,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _glowTimer?.cancel();
    _controller.dispose();
    return super.close();
  }

  @override
  ScanState? fromJson(Map<String, dynamic> json) {
    try {
      final groupIds =
          (json['selectedGroupIds'] as List<dynamic>?)
              ?.cast<String>()
              .toSet() ??
          <String>{};

      final focusStr = json['focusMode'] as String?;
      final focus = focusStr == 'onlyOnTap'
          ? ScanFocusMode.onlyOnTap
          : ScanFocusMode.auto;

      final formatNames =
          (json['formats'] as List<dynamic>?)?.cast<String>() ?? <String>[];

      final selectedFormats = <BarcodeFormat>{};
      for (final name in formatNames) {
        try {
          final fmt = BarcodeFormat.values.byName(name);
          if (fmt != BarcodeFormat.all) {
            selectedFormats.add(fmt);
          }
        } catch (_) {
          // Ignore unknown formats
        }
      }

      return ScanState.idle(
        selectedGroupIds: groupIds,
        focusMode: focus,
        selectedFormats: selectedFormats,
      );
    } catch (_) {
      return const ScanState.idle();
    }
  }

  @override
  Map<String, dynamic>? toJson(ScanState state) {
    return {
      'selectedGroupIds': state.selectedGroupIds.toList(),
      'focusMode': state.focusMode.name,
      'formats': state.selectedFormats.map((f) => f.name).toList(),
    };
  }
}
