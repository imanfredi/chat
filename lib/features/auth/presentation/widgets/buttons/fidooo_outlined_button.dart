import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/config/design_system/tokens/fidooo_typography.dart';
import 'package:flutter/material.dart';

class FidoooOutlinedButton extends OutlinedButton {
  FidoooOutlinedButton({
    Key? key,
    required String text,
    required VoidCallback onPressed,
    Color textColor = FidoooColors.primary100,
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
                    color: FidoooColors.primary100,
                  ),
                ),
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            minimumSize: Size(width, height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            side: const BorderSide(
              color: FidoooColors.primary100,
              width: 0.5,
            ),
          ),
        );
}
