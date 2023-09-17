import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/config/design_system/tokens/fidooo_typography.dart';
import 'package:flutter/material.dart';

class FidoooTextButton extends TextButton {
  FidoooTextButton(
      {Key? key,
      required String text,
      required VoidCallback onPressed,
      Color textColor = FidoooColors.neutral0,
      double width = 60.0,
      double height = 45.0})
      : super(
          key: key,
          child: Text(
            text,
            style: const FidoooTypography.button(
              color: FidoooColors.primary100,
            ),
          ),
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            minimumSize: Size(width, height),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
          ),
        );
}
