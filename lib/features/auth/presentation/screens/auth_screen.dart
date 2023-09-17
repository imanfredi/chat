import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/config/design_system/tokens/fidooo_typography.dart';
import 'package:chat/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:chat/features/auth/presentation/widgets/buttons/fidooo_filled_button.dart';
import 'package:chat/features/auth/presentation/widgets/buttons/fidooo_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'sign_in_screen.dart';

class AuthScreen extends StatelessWidget {
  static const route = "/auth";
  static const routeName = "auth";

  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                width: 200,
                image: AssetImage(
                  'assets/images/fidooo_logo.png',
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Bienvenido a Fidoo Chat",
              style:
                  FidoooTypography.headline01(color: FidoooColors.neutral100),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FidoooFilledButton(
                  text: 'Iniciar sesión',
                  onPressed: () {
                    context.goNamed(SignInScreen.routeName);
                  },
                ),
                const SizedBox(
                  width: 25,
                ),
                FidoooOutlinedButton(
                  text: 'Registrarse',
                  onPressed: () {
                    context.goNamed(SignUpScreen.routeName);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
