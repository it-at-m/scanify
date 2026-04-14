import 'package:flutter/material.dart' hide Dismissible, DismissDirection;
import 'package:flutter_application/core/widgets/dismiss_background.dart';
import 'package:flutter_application/features/scan/models/scan_model.dart';
import 'package:flutter_application/core/dismissable/dismissable.dart';
import 'package:flutter_application/core/widgets/card_widget.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:intl/intl.dart';

class ScanElementWidget extends StatelessWidget {
  const ScanElementWidget({
    super.key,
    required this.scan,
    this.selectionEnabled = false,
    this.selected = false,
    this.onSelectToggle,
    this.onDelete,
    this.dismissibleKey,
  });

  final ScanModel scan;
  final bool selectionEnabled;
  final bool selected;
  final VoidCallback? onSelectToggle;
  final VoidCallback? onDelete;
  final Key? dismissibleKey;

  static final _dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  Future<void> _vibrateAndToggle() async {
    await Haptics.vibrate(HapticsType.selection);
    onSelectToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final dateStr = _dateFormat.format(scan.createdAt);

    final meta = [
      dateStr,
      if (scan.format != null && scan.format!.trim().isNotEmpty) scan.format!,
    ].join(' · ');

    final dismissDirection = selectionEnabled
        ? DismissDirection.none
        : DismissDirection.endToStart;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: Dismissible(
          key: dismissibleKey ?? ValueKey<Object>(scan.hashCode),
          direction: dismissDirection,
          resizeDuration: const Duration(milliseconds: 200),

          background: const DismissBackground.delete(),

          confirmDismiss: (direction) async {
            if (selectionEnabled) return false;
            if (direction == DismissDirection.endToStart) {
              return onDelete != null;
            }
            return false;
          },
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              onDelete?.call();
            }
          },

          child: CardWidget(
            selected: selected,
            margin: EdgeInsets.zero,
            child: ExpansionTile(
              leading: selectionEnabled
                  ? Checkbox(
                      value: selected,
                      onChanged: (_) => _vibrateAndToggle(),
                      visualDensity: VisualDensity.compact,
                    )
                  : null,
              tilePadding: const EdgeInsets.symmetric(horizontal: 16),
              childrenPadding: EdgeInsets.zero,
              title: Text(
                scan.content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge,
              ),
              subtitle: Text(
                meta,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              children: [
                Divider(
                  height: 1,
                  thickness: 1,
                  color: theme.colorScheme.outlineVariant,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SelectableText(
                    scan.content,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
