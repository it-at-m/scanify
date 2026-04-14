import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.maxWidth = 420,
    this.scrollable = true,
  });

  final String title;
  final Widget content;
  final List<Widget> actions;
  final double maxWidth;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    Widget inner = SizedBox(width: maxWidth, child: content);

    if (scrollable) {
      inner = SingleChildScrollView(child: inner);
    }

    return AlertDialog(
      title: Text(title),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      content: inner,
      actions: actions,
    );
  }
}
