import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/config/design_system/tokens/fidooo_typography.dart';
import 'package:flutter/material.dart';

class FidoooFilledButton extends ElevatedButton {
  FidoooFilledButton({
    Key? key,
    required String text,
    required VoidCallback onPressed,
    Color backgroundColor = FidoooColors.primary100,
    Color textColor = FidoooColors.neutral0,
    double width = 120.0,
    bool isLoading = false,
    double height = 45.0,
  }) : super(
          key: key,
          child: isLoading
              ? SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: CircularProgressIndicator(
                    color: textColor,
                  ),
                )
              : Text(
                  text,
                  style: const FidoooTypography.button(
                    color: FidoooColors.neutral0,
                  ),
                ),
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: FidoooColors.primary100,
            minimumSize: Size(width, height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            elevation: 5,
          ),
        );
}
