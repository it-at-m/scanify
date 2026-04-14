import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_application/core/widgets/sheet_widget.dart';

class FormatSelectionSheet extends StatefulWidget {
  final Set<BarcodeFormat> initialFormats;

  const FormatSelectionSheet({super.key, required this.initialFormats});

  static Future<Set<BarcodeFormat>?> show(
    BuildContext context, {
    required Set<BarcodeFormat> currentFormats,
  }) async {
    return showModalBottomSheet<Set<BarcodeFormat>>(
      context: context,
      showDragHandle: true,
      builder: (_) => FormatSelectionSheet(initialFormats: currentFormats),
    );
  }

  @override
  State<FormatSelectionSheet> createState() => _FormatSelectionSheetState();
}

class _FormatSelectionSheetState extends State<FormatSelectionSheet> {
  late Set<BarcodeFormat> _currentSelection;
  late bool _useDefaultAll;

  static const _availableFormats = <BarcodeFormat>[
    BarcodeFormat.qrCode,
    BarcodeFormat.code128,
    BarcodeFormat.ean13,
    BarcodeFormat.ean8,
    BarcodeFormat.pdf417,
    BarcodeFormat.dataMatrix,
    BarcodeFormat.aztec,
    BarcodeFormat.codabar,
    BarcodeFormat.code93,
    BarcodeFormat.itf,
    BarcodeFormat.upcA,
    BarcodeFormat.upcE,
  ];

  @override
  void initState() {
    super.initState();
    _currentSelection = Set.from(widget.initialFormats);
    _useDefaultAll = _currentSelection.isEmpty;
  }

  String _formatLabel(BarcodeFormat f) => f.name.toUpperCase();

  @override
  Widget build(BuildContext context) {
    return SheetWidget(
      title: 'Select formats',
      subtitle: 'Only the selected formats can be scanned.',
      onCancel: () => Navigator.of(context).pop(),
      onConfirm: () => Navigator.of(context).pop(_currentSelection),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
            title: const Text('Default (all formats)'),
            value: _useDefaultAll,
            onChanged: (v) {
              setState(() {
                _useDefaultAll = v;
                if (_useDefaultAll) {
                  _currentSelection.clear();
                }
              });
            },
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _availableFormats.length,
              itemBuilder: (context, index) {
                final format = _availableFormats[index];
                final isSelected = _currentSelection.contains(format);

                return CheckboxListTile(
                  title: Text(_formatLabel(format)),
                  enabled: !_useDefaultAll,
                  value: isSelected,
                  onChanged: _useDefaultAll
                      ? null
                      : (checked) {
                          setState(() {
                            if (checked == true) {
                              _currentSelection.add(format);
                            } else {
                              _currentSelection.remove(format);
                            }
                          });
                        },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
