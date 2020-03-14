import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String codigo;
  Timestamp timestamp;

  Chat({this.codigo, this.timestamp});

  Chat.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    timestamp = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['senha'] = this.timestamp;
    return data;
  }
}