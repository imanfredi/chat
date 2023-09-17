import 'package:chat/features/auth/presentation/screens/auth_screen.dart';
import 'package:chat/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:chat/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:chat/features/chats/domain/models/chat.dart';
import 'package:chat/features/chats/presentation/screens/add_member_to_group_screen.dart';
import 'package:chat/features/chats/presentation/screens/chats_screen.dart';
import 'package:chat/features/chats/presentation/screens/conversation_screen.dart';
import 'package:chat/features/chats/presentation/screens/new_group_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  initialLocation: AuthScreen.route,
  routes: <RouteBase>[
    GoRoute(
      path: AuthScreen.route,
      name: AuthScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const AuthScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: SignInScreen.route,
          name: SignInScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const SignInScreen();
          },
        ),
        GoRoute(
          path: SignUpScreen.route,
          name: SignUpScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: ChatsScreen.route,
      name: ChatsScreen.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const ChatsScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: NewGroupScreen.route,
          name: NewGroupScreen.routeName,
          builder: (BuildContext context, GoRouterState state) {
            return const NewGroupScreen();
          },
        ),
        GoRoute(
            path: ConversationScreen.route,
            name: ConversationScreen.routeName,
            builder: (BuildContext context, GoRouterState state) {
              String? id = state.pathParameters['id'];
              return ConversationScreen(id: id!);
            },
            routes: <RouteBase>[
              GoRoute(
                path: AddMemberToGroupScreen.route,
                name: AddMemberToGroupScreen.routeName,
                builder: (BuildContext context, GoRouterState state) {
                  String? id =
                      state.pathParameters['id']; // -> casting is important
                  return AddMemberToGroupScreen(id: id!);
                },
              ),
            ]),
      ],
    ),
  ],
);
