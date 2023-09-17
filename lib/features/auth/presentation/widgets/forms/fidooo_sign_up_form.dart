import 'package:chat/features/shared/presentation/widgets/inputs/fidooo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

final signUpFormKey = GlobalKey<FormBuilderState>();

class FidoooSignUpForm extends StatelessWidget {
  const FidoooSignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FormBuilder(
          key: signUpFormKey,
          child: Column(
            children: [
              FidoooTextField(
                formField: 'email',
                initialValue: '',
                password: false,
                label: 'Email',
                validators: [
                  FormBuilderValidators.required(errorText: "Ingrese su email"),
                  FormBuilderValidators.email(
                      errorText: "Ingrese un mail válido"),
                ],
              ),
              const SizedBox(height: 24),
              FidoooTextField(
                formField: 'password',
                initialValue: '',
                label: 'Contraseña',
                password: true,
                validators: [
                  FormBuilderValidators.required(
                      errorText: "Ingrese su contraseña")
                ],
              ),
              const SizedBox(height: 24),
              FidoooTextField(
                formField: 'passwordConfirm',
                initialValue: '',
                label: 'Confirmación de contraseña',
                password: true,
                validators: [
                  FormBuilderValidators.required(
                      errorText: "Ingrese nuevamente su contraseña"),
                  (value) {
                    bool match = false;
                    if (value != null) {
                      String password = signUpFormKey
                              .currentState?.fields['password']?.value ??
                          '';
                      match = value.compareTo(password) == 0;
                    }
                    return match ? null : "Las contraseñas no coinciden";
                  }
                ],
              ),
            ],
          )),
    );
  }
}
