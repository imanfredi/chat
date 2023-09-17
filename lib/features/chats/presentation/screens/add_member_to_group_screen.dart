import 'package:chat/config/design_system/atoms/fidooo_icon.dart';
import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/features/chats/application/add_user_to_group.dart';
import 'package:chat/features/chats/domain/models/chat.dart';
import 'package:chat/features/chats/presentation/widgets/chat_screen/fidooo_floating_action_button.dart';
import 'package:chat/features/chats/presentation/widgets/chat_screen/fidooo_search_bar.dart';
import 'package:chat/features/chats/presentation/widgets/member_card.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/shared/presentation/widgets/fidooo_app_bar.dart';
import 'package:chat/features/user/application/get_user_by_email_controller.dart';
import 'package:chat/features/user/domain/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final searchFormKey = GlobalKey<FormBuilderState>();

class AddMemberToGroupScreen extends StatelessWidget {
  static const route = "addMembers";
  static const routeName = "addMembers";

  const AddMemberToGroupScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) => Provider<GetUserByEmailController>(
      create: (_) => GetUserByEmailController(),
      child: Scaffold(
        appBar: FidoooAppBar(
          title: 'Agregar participante',
        ),
        body: Container(
          color: FidoooColors.neutral25,
          child: Observer(
            builder: (BuildContext context) {
              final getUserByEmailController =
                  Provider.of<GetUserByEmailController>(context);
              final isLoading =
                  getUserByEmailController.state == StoreState.loading;

              return Column(
                children: [
                  FormBuilder(
                    key: searchFormKey,
                    child: FidoooSearchBar(
                      hintText: "Ingresa un mail ",
                      formField: 'searchBar',
                      initialValue: '',
                      enabled: !isLoading,
                      validators: [
                        FormBuilderValidators.required(
                            errorText: "Ingrese el mail del contacto"),
                        FormBuilderValidators.email(
                            errorText: "Ingrese un mail válido"),
                      ],
                    ),
                  ),
                  if (!isLoading &&
                      getUserByEmailController.errorMessage != null)
                    const Text("No existe el contacto"),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Observer(builder: (BuildContext context) {
          final getUserByEmailController =
              Provider.of<GetUserByEmailController>(context);
          final isLoading =
              getUserByEmailController.state == StoreState.loading;
          return FidoooFloatingActionButton(
            onPressed: isLoading ? null : () => onPressed(context, id),
            loading: isLoading,
            icon: FidoooIcons.add(
              status: FidoooIconStatus.enabledSecondary,
            ),
          );
        }),
      ));

  void onPressed(BuildContext context, String groupId) async {
    if (!searchFormKey.currentState!.validate()) {
      return;
    }

    final String email = searchFormKey.currentState!.fields['searchBar']!.value;

    AddUserToGroupController addUserToGroupController =
        AddUserToGroupController();
    final getUserByEmailController =
        Provider.of<GetUserByEmailController>(context, listen: false);
    AppUser? user = await getUserByEmailController.getUserByEmail(email: email);
    if (user != null) {
      await addUserToGroupController.addUserToGroup(
          groupId: groupId, user: user);
    }
  }
}
