import 'dart:io';

import 'package:app_chat/app/models/message.dart';
import 'package:app_chat/app/repositories/i_chat.repository.dart';
import 'package:mobx/mobx.dart';

part 'chat_controller.g.dart';

class ChatController = _ChatControllerBase with _$ChatController;

abstract class _ChatControllerBase with Store {

  final IChatRepository chatRepository;

  _ChatControllerBase(this.chatRepository);


  @observable
  ObservableStream<List<Message>> messages ;

  @observable
  bool isComposing = false;

  @observable
  bool loading = false;

  @action
  setIsComposing(value){
    isComposing = value;
  }

  @action
  getMessages(String idChat) async {
      messages = chatRepository.getMessages(idChat).asObservable();
  }

  @action
  addMessage(String idChat, Message message){
    chatRepository.addMessage(idChat, message);
  }

  @action
  Future<String> uploadImage(String idChat, File image) async {
    loading = true;
    try{
      String url = await chatRepository.uploadImage(idChat, image);
      return url;
    }catch(err){
      print(err);
      return null;
    }finally{
      loading = false;
    }
  }

}
