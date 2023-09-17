import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:flutter/material.dart';

class FidoooCircularProgressIndicator extends StatelessWidget {
  const FidoooCircularProgressIndicator({
    super.key,
    this.width = 60,
    this.height = 60,
    this.color = FidoooColors.primary100,
  });

  final Color? color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
