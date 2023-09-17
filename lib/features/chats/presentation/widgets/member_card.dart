import 'package:chat/config/design_system/tokens/fidooo_colors.dart';
import 'package:chat/features/chats/domain/models/member.dart';
import 'package:flutter/material.dart';

import '../../../../../config/design_system/tokens/fidooo_typography.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key? key,
    required this.member,
  }) : super(key: key);

  final Member member;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      constraints: const BoxConstraints(minHeight: 60),
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
        children: [
          Expanded(
            child: Text(
              member.email,
              overflow: TextOverflow.ellipsis,
              style: const FidoooTypography.caption(
                color: FidoooColors.neutral100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
