import 'package:chat/config/design_system/atoms/fidooo_icon.dart';
import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/features/chats/application/get_messages_controller.dart';
import 'package:chat/features/chats/application/send_message_to_group_controller.dart';
import 'package:chat/features/chats/domain/models/chat.dart';
import 'package:chat/features/chats/presentation/screens/add_member_to_group_screen.dart';
import 'package:chat/features/chats/presentation/widgets/conversation/chat_messages.dart';
import 'package:chat/features/chats/presentation/widgets/conversation/fidooo_input_field.dart';
import 'package:chat/features/shared/presentation/widgets/fidooo_app_bar.dart';
import 'package:chat/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

class ConversationScreen extends StatefulWidget {
  static const route = ":id";
  static const routeName = "conversation";

  const ConversationScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  GetMessagesController getMessagesController = GetMessagesController();
  SendMessageToGroupController sendMessageController =
      SendMessageToGroupController();
  final messageFormKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    getMessagesController.listenToChat(chatId: widget.id);
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FidoooAppBar(
        title: 'Chat',
        actions: [
          IconButton(
              icon: FidoooIcons.edit(
                status: FidoooIconStatus.enabledSecondary,
              ),
              onPressed: () {
                context.goNamed(
                  AddMemberToGroupScreen.routeName,
                  pathParameters: {"id": widget.id},
                );
              })
        ],
      ),
      body: Observer(builder: (_) {
        return Column(
          children: [
            Expanded(
              child: Container(
                color: FidoooColors.neutral25,
                child: ListView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  shrinkWrap: true,
                  reverse: true,
                  controller: _scrollController,
                  itemCount: getMessagesController.messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatMessages(
                      message: getMessagesController.messages[index],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 8.0,
                bottom: 12,
              ),
              child: FormBuilder(
                key: messageFormKey,
                child: FidoooInputField(
                  hintText: 'Escribe aquí...',
                  formField: 'message',
                  initialValue: '',
                  onPressed: () => onPressed(
                    groupId: widget.id,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void onPressed({
    required String groupId,
  }) async {
    final String message =
        messageFormKey.currentState!.fields['message']!.value;

    await sendMessageController.sendMessage(
      groupId: groupId,
      messageContent: message,
    );
  }

  @override
  void dispose() {
    super.dispose();
    getMessagesController.cancelListener();
  }
}
