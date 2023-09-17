import 'package:flutter/cupertino.dart';

class FidoooGrid extends Padding {
  const FidoooGrid({Key? key, required Widget child})
      : super(
          key: key,
          padding: const EdgeInsets.symmetric(horizontal: spacing),
          child: child,
        );

  static const double spacing = 15;
}
