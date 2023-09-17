import 'package:chat/features/auth/application/sign_in_controller.dart';
import 'package:chat/features/auth/presentation/widgets/buttons/fidooo_filled_button.dart';
import 'package:chat/features/auth/presentation/widgets/forms/fidooo_sign_in_form.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/shared/presentation/widgets/fidooo_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const route = "signIn";
  static const routeName = "signIn";

  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) => Provider<SignInController>(
      create: (_) => SignInController(),
      child: Scaffold(
        appBar: FidoooAppBar(
          title: 'Inicio de sesión',
        ),
        resizeToAvoidBottomInset: true,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Image(
                    width: 120,
                    image: AssetImage(
                      'assets/images/fidooo_logo.png',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FidoooSignInForm(),
                    const SizedBox(
                      height: 30,
                    ),
                    Observer(builder: (BuildContext context) {
                      final signInController =
                          Provider.of<SignInController>(context);
                      final isLoading =
                          signInController.state == StoreState.loading;

                      return FidoooFilledButton(
                        text: 'Iniciar sesión',
                        onPressed: () => isLoading ? null : onSubmit(context),
                        isLoading: isLoading,
                      );
                    })
                  ],
                ),
              ],
            ),
          ),
        ),
      ));

  void onSubmit(BuildContext context) async {
    if (!signInFormKey.currentState!.validate()) {
      return;
    }

    final String email = signInFormKey.currentState!.fields['email']!.value;
    final String password =
        signInFormKey.currentState!.fields['password']!.value;
    final signInController =
        Provider.of<SignInController>(context, listen: false);
    await signInController.signIn(email: email, password: password);
  }
}
