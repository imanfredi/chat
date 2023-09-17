import 'package:chat/features/auth/application/sign_up_controller.dart';
import 'package:chat/features/auth/presentation/widgets/buttons/fidooo_outlined_button.dart';
import 'package:chat/features/auth/presentation/widgets/forms/fidooo_sign_up_form.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/shared/presentation/widgets/fidooo_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const route = "signUp";
  static const routeName = "signUp";

  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) => Provider<SignUpController>(
      create: (_) => SignUpController(),
      child: Scaffold(
        appBar: FidoooAppBar(
          title: 'Registro',
        ),
        resizeToAvoidBottomInset: true,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  width: 100,
                  image: AssetImage(
                    'assets/images/fidooo_logo.png',
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Column(
                  children: [
                    const FidoooSignUpForm(),
                    const SizedBox(
                      height: 30,
                    ),
                    Observer(builder: (BuildContext context) {
                      final signUpController =
                          Provider.of<SignUpController>(context);
                      final isLoading =
                          signUpController.state == StoreState.loading;

                      return FidoooOutlinedButton(
                        text: 'Registrarse',
                        onPressed: () => isLoading ? null : onSubmit(context),
                        isLoading: isLoading,
                      );
                    })
                  ],
                )
              ],
            ),
          ),
        ),
      ));

  void onSubmit(BuildContext context) async {
    // if (!signUpFormKey.currentState!.validate()) {
    //   return;
    // }

    final String email = signUpFormKey.currentState!.fields['email']!.value;
    final String password =
        signUpFormKey.currentState!.fields['password']!.value;
    final signUpController =
        Provider.of<SignUpController>(context, listen: false);
    await signUpController.signUp(email: email, password: password);
  }
}
