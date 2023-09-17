import 'package:chat/config/design_system/atoms/fidooo_icon.dart';
import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/config/design_system/tokens/fidooo_typography.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class FidoooInputField extends StatefulWidget {
  const FidoooInputField({
    Key? key,
    required this.formField,
    required this.initialValue,
    this.enabled = true,
    this.password = false,
    this.hintText,
    required this.onPressed,
  }) : super(key: key);

  final String formField;
  final String? initialValue;
  final bool enabled;
  final bool password;
  final String? hintText;
  final void Function() onPressed;

  @override
  State<FidoooInputField> createState() => _FidoooInputFieldState();
}

class _FidoooInputFieldState extends State<FidoooInputField> {
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: widget.initialValue,
      name: widget.formField,
      builder: (FormFieldState field) {
        return TextField(
          cursorColor: FidoooColors.primary100,
          // obscureText: isObscured.value,
          enabled: widget.enabled,
          onChanged: (value) {
            field.didChange(value);
          },
          focusNode: _focusNode,
          controller: _controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            hintText: widget.hintText,
            hintStyle: const FidoooTypography.body01(
              color: FidoooColors.neutral75,
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
            suffixIcon: _controller.text.isEmpty
                ? null
                : IconButton(
                    icon: FidoooIcons.send(
                      status: FidoooIconStatus.enabled,
                    ),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        _controller.clear();
                        setState(() {});
                        widget.onPressed();
                      }
                    },
                  ),
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
        );
      },
    );
  }
}
