// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatController on _ChatControllerBase, Store {
  final _$messagesAtom = Atom(name: '_ChatControllerBase.messages');

  @override
  ObservableStream<List<Message>> get messages {
    _$messagesAtom.context.enforceReadPolicy(_$messagesAtom);
    _$messagesAtom.reportObserved();
    return super.messages;
  }

  @override
  set messages(ObservableStream<List<Message>> value) {
    _$messagesAtom.context.conditionallyRunInAction(() {
      super.messages = value;
      _$messagesAtom.reportChanged();
    }, _$messagesAtom, name: '${_$messagesAtom.name}_set');
  }

  final _$isComposingAtom = Atom(name: '_ChatControllerBase.isComposing');

  @override
  bool get isComposing {
    _$isComposingAtom.context.enforceReadPolicy(_$isComposingAtom);
    _$isComposingAtom.reportObserved();
    return super.isComposing;
  }

  @override
  set isComposing(bool value) {
    _$isComposingAtom.context.conditionallyRunInAction(() {
      super.isComposing = value;
      _$isComposingAtom.reportChanged();
    }, _$isComposingAtom, name: '${_$isComposingAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_ChatControllerBase.loading');

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

  final _$getMessagesAsyncAction = AsyncAction('getMessages');

  @override
  Future getMessages(String idChat) {
    return _$getMessagesAsyncAction.run(() => super.getMessages(idChat));
  }

  final _$uploadImageAsyncAction = AsyncAction('uploadImage');

  @override
  Future<String> uploadImage(String idChat, File image) {
    return _$uploadImageAsyncAction.run(() => super.uploadImage(idChat, image));
  }

  final _$_ChatControllerBaseActionController =
      ActionController(name: '_ChatControllerBase');

  @override
  dynamic setIsComposing(dynamic value) {
    final _$actionInfo = _$_ChatControllerBaseActionController.startAction();
    try {
      return super.setIsComposing(value);
    } finally {
      _$_ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addMessage(String idChat, Message message) {
    final _$actionInfo = _$_ChatControllerBaseActionController.startAction();
    try {
      return super.addMessage(idChat, message);
    } finally {
      _$_ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'messages: ${messages.toString()},isComposing: ${isComposing.toString()},loading: ${loading.toString()}';
    return '{$string}';
  }
}
