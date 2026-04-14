import 'package:flutter/material.dart' hide Dismissible, DismissDirection;
import 'package:flutter_application/core/widgets/dismiss_background.dart';
import 'package:flutter_application/features/history/models/group_model.dart';
import 'package:flutter_application/core/widgets/card_widget.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:flutter_application/core/dismissable/dismissable.dart';

class GroupElementWidget extends StatelessWidget {
  const GroupElementWidget({
    super.key,
    required this.group,
    this.onTap,
    this.selectionEnabled = false,
    this.selected = false,
    this.onSelectToggle,
    this.onEdit,
    this.onDelete,
    this.dismissibleKey,
  });

  final GroupModel group;
  final VoidCallback? onTap;
  final bool selectionEnabled;
  final bool selected;
  final VoidCallback? onSelectToggle;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final Key? dismissibleKey;

  Future<void> _vibrateAndToggle() async {
    await Haptics.vibrate(HapticsType.selection);
    onSelectToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = group.scanIds.length;

    final dismissDirection = selectionEnabled
        ? DismissDirection.none
        : DismissDirection.horizontal;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: Dismissible(
          key: dismissibleKey ?? ValueKey<Object>(group.hashCode),
          direction: dismissDirection,
          resizeDuration: const Duration(milliseconds: 200),

          background: const DismissBackground.edit(),
          secondaryBackground: const DismissBackground.delete(),

          confirmDismiss: (direction) async {
            if (selectionEnabled) return false;
            if (direction == DismissDirection.startToEnd) {
              await Haptics.vibrate(HapticsType.selection);
              onEdit?.call();
              return false;
            }
            if (direction == DismissDirection.endToStart) {
              await Haptics.vibrate(HapticsType.warning);
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
            child: ListTile(
              enableFeedback: false,
              onTap: selectionEnabled ? _vibrateAndToggle : onTap,
              onLongPress: _vibrateAndToggle,
              leading: selectionEnabled
                  ? Checkbox(
                      value: selected,
                      onChanged: (_) => _vibrateAndToggle(),
                      visualDensity: VisualDensity.compact,
                    )
                  : null,
              title: Text(group.title, style: theme.textTheme.titleMedium),
              trailing: Chip(
                label: Text('$count'),
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
