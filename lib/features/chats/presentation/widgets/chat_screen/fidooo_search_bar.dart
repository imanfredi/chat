import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/config/design_system/tokens/fidooo_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FidoooSearchBar extends StatefulWidget {
  const FidoooSearchBar({
    Key? key,
    required this.formField,
    required this.initialValue,
    this.enabled = true,
    required this.hintText,
    this.validators,
  }) : super(key: key);

  final String formField;
  final String? initialValue;
  final bool enabled;
  final String? hintText;
  final List<String? Function(String?)>? validators;

  @override
  State<FidoooSearchBar> createState() => _FidoooSearchBarState();
}

class _FidoooSearchBarState extends State<FidoooSearchBar> {
  late FocusNode _focusNode;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      initialValue: widget.initialValue,
      name: widget.formField,
      validator: (value) {
        if (widget.validators != null) {
          for (final validator in widget.validators!) {
            final error = validator(value);
            if (error != null) {
              return error;
            }
          }
        }
        return null;
      },
      builder: (FormFieldState field) {
        return Padding(
          padding: const EdgeInsets.all(3),
          child: TextField(
            cursorColor: FidoooColors.primary100,
            // obscureText: isObscured.value,
            enabled: widget.enabled,
            onChanged: (value) {
              field.didChange(value);
            },
            focusNode: _focusNode,
            controller: _controller,
            style: const FidoooTypography.body01(
              color: FidoooColors.neutral100,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const FidoooTypography.body01(
                color: FidoooColors.neutral75,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: FidoooColors.neutral50,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: FidoooColors.secondary50,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: FidoooColors.neutral75,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              errorStyle: const FidoooTypography.body01(
                color: FidoooColors.error100,
              ),
              errorMaxLines: 2,
              errorText: field.errorText,
            ),
            onTapOutside: (e) {
              _focusNode.unfocus();
            },
            onEditingComplete: () {
              _focusNode.unfocus();
            },
            onSubmitted: (value) {
              _focusNode.unfocus();
            },
          ),
        );
      },
    );
  }
}
