import 'package:flutter/material.dart';

class SheetWidget extends StatelessWidget {
  const SheetWidget({
    super.key,
    required this.title,
    this.subtitle,
    required this.body,
    this.onCancel,
    this.onConfirm,
    this.cancelText = 'Cancel',
    this.confirmText = 'Done',
    this.contentPadding = EdgeInsets.zero,
    this.actionsPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
  });

  final String title;
  final String? subtitle;
  final Widget body;

  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final String cancelText;
  final String confirmText;

  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry actionsPadding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(title),
            subtitle: subtitle != null ? Text(subtitle!) : null,
          ),
          Flexible(
            child: Padding(padding: contentPadding, child: body),
          ),
          const SizedBox(height: 8),
          if (onCancel != null || onConfirm != null)
            Padding(
              padding: actionsPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (onCancel != null)
                    TextButton(onPressed: onCancel, child: Text(cancelText)),
                  if (onCancel != null && onConfirm != null)
                    const SizedBox(width: 8),
                  if (onConfirm != null)
                    ElevatedButton(
                      onPressed: onConfirm,
                      child: Text(confirmText),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
