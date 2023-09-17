import 'package:chat/features/auth/application/sign_in_controller.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/shared/presentation/widgets/inputs/fidooo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

final signInFormKey = GlobalKey<FormBuilderState>();

class FidoooSignInForm extends StatelessWidget {
  const FidoooSignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FormBuilder(
          key: signInFormKey,
          child: Column(
            children: [
              Consumer(
                builder: (BuildContext context, value, _) {
                  final signInController =
                      Provider.of<SignInController>(context);
                  return FidoooTextField(
                    enabled: signInController.state != StoreState.loading,
                    formField: 'email',
                    initialValue: '',
                    password: false,
                    label: 'Email',
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "Ingrese su email"),
                      FormBuilderValidators.email(
                          errorText: "Ingrese un mail válido"),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),
              Consumer(builder: (BuildContext context, value, _) {
                final signInController = Provider.of<SignInController>(context);
                return Observer(builder: (BuildContext context) {
                  return FidoooTextField(
                    enabled: signInController.state != StoreState.loading,
                    formField: 'password',
                    initialValue: '',
                    label: 'Contraseña',
                    password: true,
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "Ingrese su contraseña")
                    ],
                  );
                });
              })
            ],
          )),
    );
  }
}
