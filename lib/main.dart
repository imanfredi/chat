import 'package:chat/features/auth/application/auth_service.dart';
import 'package:chat/features/chats/application/get_groups_from_user_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/router.dart';
import 'dependency_injector.dart' as di;
import 'firebase_options.dart';

AuthService authStore = AuthService();
GetGroupsFromUserController groupsFromUserController =
    GetGroupsFromUserController();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}
