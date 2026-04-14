import 'package:flutter/material.dart';

class DismissBackground extends StatelessWidget {
  final Alignment alignment;
  final Color color;
  final IconData icon;

  const DismissBackground.edit({super.key})
    : alignment = Alignment.centerLeft,
      color = Colors.blue,
      icon = Icons.edit_rounded;

  const DismissBackground.delete({super.key})
    : alignment = Alignment.centerRight,
      color = Colors.red,
      icon = Icons.delete_rounded;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Icon(icon, color: Colors.white, size: 36),
    );
  }
}
