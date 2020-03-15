import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String idUser;
  String user;
  String message;
  String urlImage;
  Timestamp timestamp;

  Message({this.user, this.message, this.timestamp});

  Message.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser'];
    user = json['user'];
    message = json['message'];
    urlImage = json['urlImage'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUser'] = this.idUser;
    data['user'] = this.user;
    data['message'] = this.message;
    data['urlImage'] = this.urlImage;
    data['timestamp'] = this.timestamp;
    return data;
  }
}