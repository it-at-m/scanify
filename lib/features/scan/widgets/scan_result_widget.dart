import 'package:flutter/material.dart';

class ScanResultWidget extends StatefulWidget {
  final String text;
  final String hintText;
  final int lines;
  final TextStyle? textStyle;
  final bool glow;

  const ScanResultWidget({
    super.key,
    this.text = '',
    this.hintText = 'Waiting for scan...',
    this.lines = 4,
    this.textStyle,
    this.glow = false,
  });

  @override
  State<ScanResultWidget> createState() => _ScanResultWidgetState();
}

class _ScanResultWidgetState extends State<ScanResultWidget> {
  late final ScrollController _scrollController;
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _textController = TextEditingController(text: widget.text);
  }

  @override
  void didUpdateWidget(ScanResultWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != oldWidget.text) {
      _textController.text = widget.text;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: widget.glow ? Colors.lightGreen : Colors.transparent,
          width: 2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: TextField(
            controller: _textController,
            readOnly: true,
            showCursor: false,
            minLines: widget.lines,
            maxLines: widget.lines,
            scrollController: _scrollController,
            scrollPhysics: const BouncingScrollPhysics(),
            textAlign: TextAlign.center,
            style: widget.textStyle ?? theme.textTheme.bodyMedium,
            decoration: InputDecoration(
              isCollapsed: false,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
