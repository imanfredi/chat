// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_to_group.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddUserToGroupController on _AddUserToGroupControllerBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_AddUserToGroupControllerBase.state'))
          .value;

  late final _$_addUserToGroupFutureAtom = Atom(
      name: '_AddUserToGroupControllerBase._addUserToGroupFuture',
      context: context);

  @override
  ObservableFuture<Either<Failure, Member>>? get _addUserToGroupFuture {
    _$_addUserToGroupFutureAtom.reportRead();
    return super._addUserToGroupFuture;
  }

  @override
  set _addUserToGroupFuture(ObservableFuture<Either<Failure, Member>>? value) {
    _$_addUserToGroupFutureAtom.reportWrite(value, super._addUserToGroupFuture,
        () {
      super._addUserToGroupFuture = value;
    });
  }

  late final _$errorMessageAtom = Atom(
      name: '_AddUserToGroupControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$addUserToGroupAsyncAction = AsyncAction(
      '_AddUserToGroupControllerBase.addUserToGroup',
      context: context);

  @override
  Future<dynamic> addUserToGroup(
      {required String groupId, required AppUser user}) {
    return _$addUserToGroupAsyncAction
        .run(() => super.addUserToGroup(groupId: groupId, user: user));
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
