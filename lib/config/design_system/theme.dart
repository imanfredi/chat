import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:flutter/material.dart';

/// Default [ThemeData] for Fidoo
class AppTheme {
  /// Default constructor for Fidoo [ThemeData]
  AppTheme(this._brightness);

  final Brightness _brightness;

  /// Exposes theme data to MaterialApp
  ThemeData get themeData {
    return ThemeData(
      brightness: _brightness,
      fontFamily: 'EncodeSans',
    ).copyWith(
      colorScheme: _colorScheme,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ),
    );
  }

  ColorScheme get _colorScheme => ColorScheme.fromSeed(
        seedColor: FidoooColors.primary100,
        primary: FidoooColors.primary100,
        onPrimary: FidoooColors.neutral0,
        background: FidoooColors.neutral0,
        brightness: _brightness,
      );
}
