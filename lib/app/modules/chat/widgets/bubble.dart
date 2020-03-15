import 'package:app_chat/app/models/message.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                width: 300.0,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SelectableText(message.user ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white
                          ),),
                        SizedBox(height: 5,),
                        Column(
                          children: <Widget>[
                            message.urlImage != null ? CachedNetworkImage(
                              width: 250,
                              height: 350,
                              imageUrl: message.urlImage,
                              placeholder: (context, url) => SizedBox(height: 350,),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                              
                            )
                            :
                            Container(
                            width: 250,
                              child: SelectableText(
                              message.message ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(message.timestamp != null ? formataData(message.timestamp) : "", style: TextStyle(fontSize: 11, color: Color.fromRGBO(255, 255, 255, .7)),),
                      ],
                    )
                  ],
                )
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