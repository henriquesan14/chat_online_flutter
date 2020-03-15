import 'dart:io';

import 'package:app_chat/app/models/chat.dart';
import 'package:app_chat/app/models/message.dart';

abstract class IChatRepository {
  Future createSala(Chat chat);
  Stream<List<Message>> getMessages(String idChat);
  Future addMessage(String idChat, Message message);
  Future<String> uploadImage(String idChat, File image);
}