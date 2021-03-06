import 'dart:io';

import 'package:app_chat/app/models/chat.dart';
import 'package:app_chat/app/models/message.dart';
import 'package:app_chat/app/repositories/i_chat.repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatRepository extends Disposable implements IChatRepository {
  final Firestore firestore;

  ChatRepository(this.firestore);

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future createSala(Chat chat) async {
    await firestore
        .collection("chats")
        .document(chat.codigo)
        .setData({'timestamp': FieldValue.serverTimestamp()});
  }

  @override
  Stream<List<Message>> getMessages(String codigoChat) {
    return firestore
        .collection('chats')
        .document(codigoChat)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return Message.fromJson(doc.data);
      }).toList();
    });
  }

  @override
  Future addMessage(String idChat, Message message) async {
    await firestore
        .collection("chats")
        .document(idChat)
        .collection("messages")
        .add({
      'idUser': message.idUser,
      'user': message.user,
      'message': message.message,
      'urlImage': message.urlImage,
      'timestamp': FieldValue.serverTimestamp()
    });
  }

  @override
  Future<String> uploadImage(String idChat, File image) async {
    StorageUploadTask task = FirebaseStorage.instance.ref().child("images_chat")
      .child(idChat + DateTime.now().millisecondsSinceEpoch.toString()).putFile(image);
    var url = await (await task.onComplete).ref.getDownloadURL();
    return url;
  }
}
