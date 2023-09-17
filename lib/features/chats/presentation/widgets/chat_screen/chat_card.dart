import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/features/chats/domain/models/group_chat.dart';
import 'package:chat/features/chats/presentation/screens/conversation_screen.dart';
import 'package:chat/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../config/design_system/tokens/fidooo_typography.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
  }) : super(key: key);

  final GroupChat chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          constraints: const BoxConstraints(minHeight: 85),
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(
            vertical: 3,
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            color: FidoooColors.neutral10,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chat.groupName,
                        overflow: TextOverflow.ellipsis,
                        style: const FidoooTypography.caption(
                            color: FidoooColors.neutral100),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      if (chat.lastMessage != null)
                        Text(
                          chat.lastMessage!.messenger.id == authStore.user!.id
                              ? 'Tu: ${chat.lastMessage!.content}'
                              : chat.lastMessage!.content,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: const FidoooTypography.body01(
                              color: FidoooColors.neutral100),
                        )
                    ]),
              ),
              if (chat.lastMessage != null)
                Text(
                  DateFormat.Hm().format(chat.lastMessage!.creationTime),
                  style: const FidoooTypography.headline02(
                    color: FidoooColors.neutral100,
                  ),
                ),
            ],
          ),
        ),
        onTap: () {
          context.goNamed(
            ConversationScreen.routeName,
            pathParameters: {"id": chat.id},
          );
        });
  }
}
