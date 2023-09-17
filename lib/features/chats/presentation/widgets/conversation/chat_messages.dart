import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/features/chats/domain/models/message.dart';
import 'package:chat/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../config/design_system/tokens/fidooo_typography.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    bool isMine = message.messenger.id == authStore.user!.id;

    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(4.0),
      alignment: isMine ? Alignment.centerLeft : Alignment.centerRight,
      constraints: const BoxConstraints(maxWidth: 300.0),
      decoration: BoxDecoration(
        color: isMine ? FidoooColors.secondary50 : FidoooColors.primary50,
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft:
                isMine ? const Radius.circular(15) : const Radius.circular(0),
            bottomRight:
                isMine ? const Radius.circular(0) : const Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    message.messenger.email,
                    overflow: TextOverflow.ellipsis,
                    style: const FidoooTypography.headline02(
                        color: FidoooColors.neutral0),
                  ),
                  Text(
                    message.content,
                    style: const FidoooTypography.body01(
                        color: FidoooColors.neutral0),
                  ),
                ]),
          ),
          Text(
            DateFormat.Hm().format(message.creationTime),
            style: const FidoooTypography.headline02(
              color: FidoooColors.neutral0,
            ),
          ),
        ],
      ),
    );
  }
}
