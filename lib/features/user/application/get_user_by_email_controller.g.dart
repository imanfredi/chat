// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_by_email_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetUserByEmailController on _GetUserByEmailControllerBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_GetUserByEmailControllerBase.state'))
          .value;

  late final _$_getUserByEmailFutureAtom = Atom(
      name: '_GetUserByEmailControllerBase._getUserByEmailFuture',
      context: context);

  @override
  ObservableFuture<Either<Failure, AppUser>>? get _getUserByEmailFuture {
    _$_getUserByEmailFutureAtom.reportRead();
    return super._getUserByEmailFuture;
  }

  @override
  set _getUserByEmailFuture(ObservableFuture<Either<Failure, AppUser>>? value) {
    _$_getUserByEmailFutureAtom.reportWrite(value, super._getUserByEmailFuture,
        () {
      super._getUserByEmailFuture = value;
    });
  }

  late final _$errorMessageAtom = Atom(
      name: '_GetUserByEmailControllerBase.errorMessage', context: context);

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

  late final _$getUserByEmailAsyncAction = AsyncAction(
      '_GetUserByEmailControllerBase.getUserByEmail',
      context: context);

  @override
  Future<AppUser?> getUserByEmail({required String email}) {
    return _$getUserByEmailAsyncAction
        .run(() => super.getUserByEmail(email: email));
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
