import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:flutter/material.dart';

class FidoooIcons extends Icon {
  FidoooIcons({
    Key? key,
    required IconData icon,
    required FidoooIconStatus status,
    double size = 24,
  }) : super(
          key: key,
          icon,
          color: status.color,
          size: size,
        );

  /// Show Icon
  FidoooIcons.showFilled({
    Key? key,
    required FidoooIconStatus status,
    hide = false,
  }) : this(
          key: key,
          icon: hide ? Icons.visibility : Icons.visibility_off,
          status: status,
        );

  /// Error Icon
  FidoooIcons.errorFilled({
    Key? key,
    required FidoooIconStatus status,
  }) : this(
          key: key,
          icon: Icons.error,
          status: status,
        );

  /// Close Icon
  FidoooIcons.close({
    Key? key,
    required FidoooIconStatus status,
  }) : this(
          key: key,
          icon: Icons.close,
          status: status,
        );

  /// More Icon
  FidoooIcons.logout({
    Key? key,
    required FidoooIconStatus status,
  }) : this(
          key: key,
          icon: Icons.logout,
          status: status,
        );

  /// Add Icon
  FidoooIcons.add({
    Key? key,
    required FidoooIconStatus status,
  }) : this(
          key: key,
          icon: Icons.add,
          status: status,
        );

  /// Send Icon
  FidoooIcons.send({
    Key? key,
    required FidoooIconStatus status,
  }) : this(
          key: key,
          icon: Icons.send,
          status: status,
        );

  /// Edit Icon
  FidoooIcons.edit({
    Key? key,
    required FidoooIconStatus status,
  }) : this(
          key: key,
          icon: Icons.edit,
          status: status,
        );
}

enum FidoooIconStatus {
  enabled(FidoooColors.primary100),
  enabledSecondary(FidoooColors.neutral0),
  disabled(FidoooColors.neutral25),
  error(FidoooColors.error100);

  final Color color;

  const FidoooIconStatus(this.color);
}
