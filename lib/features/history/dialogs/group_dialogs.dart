import 'package:flutter/material.dart';
import 'package:flutter_application/core/widgets/dialog_widget.dart';
import 'package:flutter_application/features/history/models/group_model.dart';
import 'package:reactive_forms/reactive_forms.dart';

Future<(String, bool, int?, int?, int?)?> showCreateGroupDialog(
  BuildContext context,
) async {
  return _showGroupDialog(
    context: context,
    title: 'Create group',
    confirmLabel: 'Create',
    form: _buildGroupForm(),
  );
}

Future<(String, bool, int?, int?, int?)?> showEditGroupDialog(
  BuildContext context,
  GroupModel group,
) async {
  return _showGroupDialog(
    context: context,
    title: 'Edit group',
    confirmLabel: 'Save',
    form: _buildGroupForm(group),
  );
}

Future<(String, bool, int?, int?, int?)?> _showGroupDialog({
  required BuildContext context,
  required String title,
  required String confirmLabel,
  required FormGroup form,
}) {
  return showDialog<(String, bool, int?, int?, int?)>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return ReactiveForm(
        formGroup: form,
        child: DialogWidget(
          title: title,
          content: const _GroupFormContent(),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null),
              child: const Text('Cancel'),
            ),
            ReactiveFormConsumer(
              builder: (context, form, child) {
                return FilledButton(
                  onPressed: form.valid
                      ? () {
                          final v = form.value;
                          Navigator.of(context).pop((
                            (v['title'] as String).trim(),
                            v['noDupes'] as bool? ?? true,
                            v['minLen'] as int?,
                            v['maxLen'] as int?,
                            v['maxItems'] as int?,
                          ));
                        }
                      : () => form.markAllAsTouched(),
                  child: Text(confirmLabel),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}

FormGroup _buildGroupForm([GroupModel? group]) {
  final isCreate = group == null;

  return FormGroup(
    {
      'title': FormControl<String>(
        value: group?.title,
        validators: [
          Validators.required,
          Validators.minLength(1),
          Validators.maxLength(50),
        ],
      ),
      'noDupes': FormControl<bool>(value: group?.noDuplicates ?? true),
      'minLen': FormControl<int>(
        value: isCreate ? 1 : group.minContentLength,
        validators: [Validators.min(1), Validators.max(2000)],
      ),
      'maxLen': FormControl<int>(
        value: isCreate ? 2000 : group.maxContentLength,
        validators: [Validators.min(1), Validators.max(2000)],
      ),
      'maxItems': FormControl<int>(
        value: isCreate ? 1000 : group.maxItems,
        validators: [Validators.min(1), Validators.max(1000)],
      ),
    },
    validators: [Validators.delegate(_lengthBoundsValidator)],
  );
}

class _GroupFormContent extends StatelessWidget {
  const _GroupFormContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        ReactiveTextField<String>(
          formControlName: 'title',
          textInputAction: TextInputAction.next,
          autocorrect: false,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(
            labelText: 'Group title',
            hintText: 'Z.B. IMEIs',
            border: OutlineInputBorder(),
            isDense: true,
          ),
          validationMessages: {
            ValidationMessage.required: (_) => 'Title is required',
            ValidationMessage.maxLength: (_) => 'Max 50 characters',
          },
        ),
        const SizedBox(height: 16),
        const _NumberField(
          name: 'minLen',
          label: 'Min content length',
          hint: '1 - 2000',
        ),
        const SizedBox(height: 16),
        const _NumberField(
          name: 'maxLen',
          label: 'Max content length',
          hint: '1 - 2000',
        ),
        const SizedBox(height: 16),
        const _NumberField(
          name: 'maxItems',
          label: 'Max items limit',
          hint: '1 - 1000',
          helper: 'Drop oldest items if limit is reached.',
        ),
        ReactiveFormConsumer(
          builder: (context, form, _) {
            if (form.hasError('minGreaterThanMax')) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Minimum length cannot be greater than maximum.',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        const SizedBox(height: 12),
        ReactiveSwitchListTile(
          formControlName: 'noDupes',
          title: const Text('Drop duplicates'),
          subtitle: const Text('Ignore identical scans'),
          contentPadding: EdgeInsets.zero,
        ),
      ],
    );
  }
}

class _NumberField extends StatelessWidget {
  const _NumberField({
    required this.name,
    required this.label,
    this.hint,
    this.helper,
  });

  final String name;
  final String label;
  final String? hint;
  final String? helper;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<int>(
      formControlName: name,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        helperText: helper,
        border: const OutlineInputBorder(),
        isDense: true,
        suffixText: 'chars',
      ),
      validationMessages: {
        ValidationMessage.min: (e) => 'Min value is ${(e as Map)['min']}',
        ValidationMessage.max: (e) => 'Max value is ${(e as Map)['max']}',
        ValidationMessage.number: (_) => 'Must be a number',
      },
    );
  }
}

Map<String, Object>? _lengthBoundsValidator(AbstractControl control) {
  if (control is! FormGroup) return null;
  final minLen = control.control('minLen').value as int?;
  final maxLen = control.control('maxLen').value as int?;

  if (minLen != null && maxLen != null && minLen > maxLen) {
    return {'minGreaterThanMax': true};
  }
  return null;
}
