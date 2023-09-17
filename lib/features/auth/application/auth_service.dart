import 'dart:async';

import 'package:chat/dependency_injector.dart';
import 'package:chat/features/user/domain/models/user.dart';
import 'package:chat/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'auth_service.g.dart';

class AuthService = _AuthServiceBase with _$AuthService;

abstract class _AuthServiceBase with Store {
  StreamSubscription<dynamic>? listener;
  final FirebaseFirestore _db = getIt<FirebaseFirestore>();

  @observable
  AppUser? _user;

  @computed
  AppUser? get user => _user;

  @computed
  bool get isAuthenticated => _user != null;

  @action
  void setUser(AppUser? user) {
    _user = user;
    if (user != null) {
      if (listener == null) {
        groupsFromUserController.listenToGroupIds();
      }
    } else {
      groupsFromUserController.cancelListenToGroupIds();
    }
  }
}
