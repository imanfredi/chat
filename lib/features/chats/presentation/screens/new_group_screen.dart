import 'package:chat/config/design_system/atoms/fidooo_icon.dart';
import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/features/chats/application/create_group_controller.dart';
import 'package:chat/features/chats/presentation/widgets/chat_screen/fidooo_floating_action_button.dart';
import 'package:chat/features/chats/presentation/widgets/chat_screen/fidooo_search_bar.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/shared/presentation/widgets/fidooo_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

final newGroupFormKey = GlobalKey<FormBuilderState>();

class NewGroupScreen extends StatelessWidget {
  static const route = "newGroup";
  static const routeName = "newGroup";

  const NewGroupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Provider<CreateGroupController>(
        create: (_) => CreateGroupController(),
        child: Scaffold(
          appBar: FidoooAppBar(
            title: 'Nuevo grupo',
          ),
          body: Container(
            color: FidoooColors.neutral25,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 1.0),
                  child: Observer(
                    builder: (BuildContext context) {
                      final createGroupController =
                          Provider.of<CreateGroupController>(context);
                      final isLoading =
                          createGroupController.state == StoreState.loading;

                      return Column(
                        children: [
                          FormBuilder(
                            key: newGroupFormKey,
                            child: FidoooSearchBar(
                              hintText: "Ingresa un nombre ",
                              formField: 'groupName',
                              initialValue: '',
                              enabled: !isLoading,
                              validators: [
                                FormBuilderValidators.required(
                                    errorText: "Ingrese el mail del contacto"),
                                FormBuilderValidators.minLength(5,
                                    errorText: "Mínimo 5 caracteres")
                              ],
                            ),
                          ),
                          if (!isLoading &&
                              createGroupController.errorMessage != null)
                            Text(
                                createGroupController.errorMessage!.toString()),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Observer(builder: (BuildContext context) {
            final getUserByEmailController =
                Provider.of<CreateGroupController>(context);
            final isLoading =
                getUserByEmailController.state == StoreState.loading;
            return FidoooFloatingActionButton(
              onPressed: isLoading ? null : () => onPressed(context),
              loading: isLoading,
              icon: FidoooIcons.add(
                status: FidoooIconStatus.enabledSecondary,
              ),
            );
          }),
        ),
      );

  void onPressed(BuildContext context) async {
    if (!newGroupFormKey.currentState!.validate()) {
      return;
    }

    final String groupName =
        newGroupFormKey.currentState!.fields['groupName']!.value;

    final createGroupController =
        Provider.of<CreateGroupController>(context, listen: false);

    await createGroupController.createGroup(groupName: groupName);
  }
}
