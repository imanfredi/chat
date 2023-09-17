import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/config/design_system/tokens/fidooo_typography.dart';
import 'package:flutter/material.dart';

class FidoooAppBar extends AppBar {
  FidoooAppBar({
    required String title,
    Key? key,
    Widget? leading,
    List<Widget>? actions,
  }) : super(
          key: key,
          leading: leading,
          actions: actions,
          backgroundColor: FidoooColors.primary100,
          surfaceTintColor: FidoooColors.primary100,
          elevation: 20,
          centerTitle: false,
          title: Title(
            color: FidoooColors.neutral0,
            child: Text(
              title,
              style: const FidoooTypography.headline02(
                color: FidoooColors.neutral0,
              ),
            ),
          ),
        );
}
