// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthService on _AuthServiceBase, Store {
  Computed<AppUser?>? _$userComputed;

  @override
  AppUser? get user => (_$userComputed ??=
          Computed<AppUser?>(() => super.user, name: '_AuthServiceBase.user'))
      .value;
  Computed<bool>? _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated =>
      (_$isAuthenticatedComputed ??= Computed<bool>(() => super.isAuthenticated,
              name: '_AuthServiceBase.isAuthenticated'))
          .value;

  late final _$_userAtom =
      Atom(name: '_AuthServiceBase._user', context: context);

  @override
  AppUser? get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(AppUser? value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  late final _$_AuthServiceBaseActionController =
      ActionController(name: '_AuthServiceBase', context: context);

  @override
  void setUser(AppUser? user) {
    final _$actionInfo = _$_AuthServiceBaseActionController.startAction(
        name: '_AuthServiceBase.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_AuthServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
