import 'package:chat/config/router.dart';
import 'package:chat/features/auth/data/datasources/auth_data_source.dart';
import 'package:chat/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chat/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat/features/chats/data/datasources/chat_datasource.dart';
import 'package:chat/features/chats/data/repositories/chat_repository_impl.dart';
import 'package:chat/features/chats/domain/repositories/chat_repository.dart';
import 'package:chat/features/user/data/datasources/user_data_source.dart';
import 'package:chat/features/user/data/repositories/user_repository_impl.dart';
import 'package:chat/features/user/domain/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<GoRouter>(router);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<AuthDataSource>(AuthDatasourceImpl());
  getIt.registerSingleton<UserDatasource>(UserDatasourceImpl());
  getIt.registerSingleton<ChatDatasource>(ChatDatasourceImpl());
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<ChatRepository>(ChatRepositoryImpl());
}
