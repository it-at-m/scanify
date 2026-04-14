import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.child,
    this.selected = false,
    this.margin,
  });

  final Widget child;
  final bool selected;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: selected
              ? theme.colorScheme.primary
              : theme.colorScheme.outlineVariant,
        ),
      ),
      child: child,
    );
  }
}
