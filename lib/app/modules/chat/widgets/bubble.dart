import 'package:app_chat/app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {

  Bubble(this.message, this.user, this.idUser);

  final Message message;
  final String user;
  final String idUser;

  @override
  Widget build(BuildContext context) {
    bool isMe = idUser == message.idUser;
    final bg = isMe ? const Color.fromRGBO(0, 0, 0, 1) : Colors.blue;
    final align = isMe ? MainAxisAlignment.end : MainAxisAlignment.start;
    final radius = !isMe
        ? BorderRadius.only(
            topRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(5.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(10.0),
          );
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: align,
            children: <Widget>[
              Container(
                width: 250.0,
                margin: const EdgeInsets.only(bottom:15.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: .5,
                    spreadRadius: 1.0,
                    color: Colors.black.withOpacity(.12))
                ],
                color: bg,
                borderRadius: radius,
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          child: Text(message.user ?? "", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white
                          ),),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          child: Text(message.message ?? "", style: TextStyle(color: Colors.white),),
                          alignment: Alignment.topLeft, 
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Row(
                        children: <Widget>[
                          Text(message.timestamp != null ? formataData(message.timestamp) : "", style: TextStyle(fontSize: 11, color: Color.fromRGBO(255, 255, 255, .7)),),
                          SizedBox(width: 3.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ), 
        ],
      ),
    );
  }
}

formataData(Timestamp dataHora){
  if(dataHora != null){
    DateTime data = dataHora.toDate();
    String dataFormatada = formatDate(data, [ HH, ':', nn]);
    return dataFormatada;
  }
}