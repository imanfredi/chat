import 'package:flutter/material.dart';

import 'fidooo_colors.dart';

class FidoooTypography extends TextStyle {
  const FidoooTypography({
    required Color? color,
    required FontWeight fontWeight,
    required double fontSize,
  }) : super(
          fontFamily: 'EncodeSans',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        );

  static const _headline01 = 24.0;
  static const _headline02 = 20.0;
  static const _subtitle01 = 16.0;
  static const _caption = 16.0;
  static const _body01 = 14.0;
  static const _body02 = 12.0;
  static const _button = 14.0;
  static const _overline = 10.0;

  const FidoooTypography.headline01({
    Color color = FidoooColors.neutral100,
  }) : this(
          fontSize: _headline01,
          fontWeight: FontWeight.w400,
          color: color,
        );

  const FidoooTypography.headline02({
    Color color = FidoooColors.neutral100,
  }) : this(
          fontSize: _headline02,
          fontWeight: FontWeight.w500,
          color: color,
        );

  const FidoooTypography.subtitle01({
    Color color = FidoooColors.neutral100,
  }) : this(
          fontSize: _subtitle01,
          fontWeight: FontWeight.w400,
          color: color,
        );

  const FidoooTypography.body01({
    Color color = FidoooColors.neutral100,
  }) : this(
          fontSize: _body01,
          fontWeight: FontWeight.w400,
          color: color,
        );

  const FidoooTypography.body02({
    Color color = FidoooColors.neutral100,
  }) : this(
          fontSize: _body02,
          fontWeight: FontWeight.w400,
          color: color,
        );

  const FidoooTypography.button({
    Color color = FidoooColors.neutral100,
  }) : this(
          fontSize: _button,
          fontWeight: FontWeight.w500,
          color: color,
        );

  const FidoooTypography.caption({
    Color color = FidoooColors.neutral100,
  }) : this(
          fontSize: _caption,
          fontWeight: FontWeight.w600,
          color: color,
        );

  const FidoooTypography.overline({
    Color color = FidoooColors.neutral100,
  }) : this(
          fontSize: _overline,
          fontWeight: FontWeight.w500,
          color: color,
        );
}
