// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_group_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateGroupController on _CreateGroupControllerBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: '_CreateGroupControllerBase.state'))
          .value;

  late final _$_createGroupFutureAtom = Atom(
      name: '_CreateGroupControllerBase._createGroupFuture', context: context);

  @override
  ObservableFuture<Either<Failure, GroupChat>>? get _createGroupFuture {
    _$_createGroupFutureAtom.reportRead();
    return super._createGroupFuture;
  }

  @override
  set _createGroupFuture(ObservableFuture<Either<Failure, GroupChat>>? value) {
    _$_createGroupFutureAtom.reportWrite(value, super._createGroupFuture, () {
      super._createGroupFuture = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CreateGroupControllerBase.errorMessage', context: context);

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

  late final _$createGroupAsyncAction =
      AsyncAction('_CreateGroupControllerBase.createGroup', context: context);

  @override
  Future<dynamic> createGroup({required String groupName}) {
    return _$createGroupAsyncAction
        .run(() => super.createGroup(groupName: groupName));
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
