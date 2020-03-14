// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_sala_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewSalaController on _NewSalaControllerBase, Store {
  final _$loadingAtom = Atom(name: '_NewSalaControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$createSalaAsyncAction = AsyncAction('createSala');

  @override
  Future<dynamic> createSala(Chat chat) {
    return _$createSalaAsyncAction.run(() => super.createSala(chat));
  }

  @override
  String toString() {
    final string = 'loading: ${loading.toString()}';
    return '{$string}';
  }
}
