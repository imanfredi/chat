import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:flutter/material.dart';

class FidoooFloatingActionButton extends FloatingActionButton {
  const FidoooFloatingActionButton({
    super.key,
    required VoidCallback? onPressed,
    Color? foregroundColor = FidoooColors.neutral0,
    Color? backgroundColor = FidoooColors.secondary50,
    ShapeBorder? shape = const CircleBorder(),
    required Widget icon,
    bool loading = false,
  }) : super(
            onPressed: onPressed,
            foregroundColor: FidoooColors.neutral0,
            backgroundColor:
                loading ? FidoooColors.neutral50 : FidoooColors.secondary50,
            shape: const CircleBorder(),
            child: icon);
}
