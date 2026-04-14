import 'package:flutter/material.dart';
import 'package:flutter_application/core/widgets/sheet_widget.dart';
import 'package:flutter_application/features/scan/bloc/scan_state.dart';

class FocusSelectionSheet extends StatefulWidget {
  final ScanFocusMode initialMode;

  const FocusSelectionSheet({super.key, required this.initialMode});

  static Future<ScanFocusMode?> show(
    BuildContext context, {
    required ScanFocusMode currentMode,
  }) async {
    return showModalBottomSheet<ScanFocusMode>(
      context: context,
      showDragHandle: true,
      builder: (_) => FocusSelectionSheet(initialMode: currentMode),
    );
  }

  @override
  State<FocusSelectionSheet> createState() => _FocusSelectionSheetState();
}

class _FocusSelectionSheetState extends State<FocusSelectionSheet> {
  late ScanFocusMode _mode;

  @override
  void initState() {
    super.initState();
    _mode = widget.initialMode;
  }

  @override
  Widget build(BuildContext context) {
    return SheetWidget(
      title: 'Select focus',
      subtitle: 'Set the focus mode for the camera.',
      onCancel: () => Navigator.of(context).pop(),
      onConfirm: () => Navigator.of(context).pop(_mode),

      body: RadioGroup<ScanFocusMode>(
        groupValue: _mode,
        onChanged: (ScanFocusMode? value) {
          if (value != null) {
            setState(() => _mode = value);
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            RadioListTile<ScanFocusMode>(
              title: Text('Auto'),
              value: ScanFocusMode.auto,
            ),
            RadioListTile<ScanFocusMode>(
              title: Text('Only on tap'),
              value: ScanFocusMode.onlyOnTap,
            ),
          ],
        ),
      ),
    );
  }
}
