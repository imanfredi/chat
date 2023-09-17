import 'package:chat/config/design_system/atoms/fidooo_icon.dart';
import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/config/design_system/tokens/fidooo_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FidoooTextField extends StatefulWidget {
  const FidoooTextField({
    Key? key,
    required this.formField,
    required this.initialValue,
    this.enabled = true,
    this.password = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.label,
    this.validators,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String formField;
  final String? initialValue;
  final bool enabled;
  final bool password;
  final FloatingLabelBehavior floatingLabelBehavior;
  final String? label;
  final List<String? Function(String?)>? validators;
  final TextInputType keyboardType;

  @override
  State<FidoooTextField> createState() => _FidoooTextFieldState();
}

class _FidoooTextFieldState extends State<FidoooTextField> {
  late FocusNode _focusNode;
  final TextEditingController _controller = TextEditingController();
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _isObscured = widget.password;
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
        return TextField(
          cursorColor: FidoooColors.primary100,
          obscureText: _isObscured,
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
            labelText: widget.label,
            labelStyle: FidoooTypography.subtitle01(
              color: widget.enabled
                  ? FidoooColors.neutral75
                  : FidoooColors.neutral50,
            ),
            floatingLabelBehavior: widget.floatingLabelBehavior,
            floatingLabelStyle: FidoooTypography.subtitle01(
              color: widget.enabled
                  ? FidoooColors.primary100
                  : FidoooColors.neutral50,
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
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: FidoooColors.error100,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            errorStyle: const FidoooTypography.body01(
              color: FidoooColors.error100,
            ),
            errorMaxLines: 2,
            errorText: field.errorText,
            suffixIcon: !widget.enabled
                ? null
                : widget.password
                    ? IconButton(
                        icon: FidoooIcons.showFilled(
                          status: FidoooIconStatus.enabled,
                          hide: _isObscured,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      )
                    : field.hasError
                        ? IconButton(
                            icon: FidoooIcons.errorFilled(
                              status: FidoooIconStatus.error,
                            ),
                            onPressed: () {
                              if (_controller.text.isNotEmpty) {
                                _controller.clear();
                                field.reset();
                              }
                            },
                          )
                        : _controller.text.isEmpty
                            ? null
                            : IconButton(
                                icon: FidoooIcons.close(
                                  status: FidoooIconStatus.enabled,
                                ),
                                onPressed: () {
                                  if (_controller.text.isNotEmpty) {
                                    _controller.clear();
                                    field.reset();
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
