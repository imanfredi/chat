import 'package:chat/config/design_system/atoms/fidooo_icon.dart';
import 'package:chat/config/design_system/molecules/fidooo_loading_spinner.dart';
import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/features/auth/application/sign_out_controller.dart';
import 'package:chat/features/chats/domain/models/group_chat.dart';
import 'package:chat/features/chats/presentation/screens/new_group_screen.dart';
import 'package:chat/features/chats/presentation/widgets/chat_screen/chat_card.dart';
import 'package:chat/features/chats/presentation/widgets/chat_screen/fidooo_floating_action_button.dart';
import 'package:chat/features/core/application/store_state.dart';
import 'package:chat/features/shared/presentation/widgets/fidooo_app_bar.dart';
import 'package:chat/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ChatsScreen extends StatefulWidget {
  static const route = "/chats";
  static const routeName = "chats";

  const ChatsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FidoooAppBar(
        title: 'Fidooo Chat',
        actions: [
          Provider<SignOutController>(
            create: (_) => SignOutController(),
            child: Observer(
              builder: (BuildContext context) {
                final signOutController =
                    Provider.of<SignOutController>(context);
                final isLoading = signOutController.state == StoreState.loading;

                return IconButton(
                    icon: FidoooIcons.logout(
                      status: FidoooIconStatus.enabledSecondary,
                    ),
                    onPressed: () =>
                        isLoading ? null : signOutController.signOut());
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FidoooFloatingActionButton(
        onPressed: () => context.goNamed(NewGroupScreen.routeName),
        icon: FidoooIcons.add(status: FidoooIconStatus.enabledSecondary),
      ),
      resizeToAvoidBottomInset: false,
      body: Observer(
        builder: (_) {
          List<GroupChat> groupChats = groupsFromUserController.chats;
          if (groupChats.isEmpty) {
            return const Center(
              child: Text("Inicia un nuevo chat"),
            );
          }
          return Column(
            children: [
              Expanded(
                child: Container(
                  color: FidoooColors.neutral25,
                  child: ListView.builder(
                    itemCount: groupChats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ChatCard(
                        chat: groupChats[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
