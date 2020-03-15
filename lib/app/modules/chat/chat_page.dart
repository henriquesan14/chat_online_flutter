import 'package:after_init/after_init.dart';
import 'package:app_chat/app/models/message.dart';
import 'package:app_chat/app/modules/chat/chat_controller.dart';
import 'package:app_chat/app/modules/chat/widgets/bubble.dart';
import 'package:app_chat/app/modules/chat/widgets/text_composer.dart';
import 'package:app_chat/app/utils/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatPage extends StatefulWidget {
  final String user;
  final String codigoChat;
  const ChatPage(this.codigoChat, this.user,{Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends ModularState<ChatPage, ChatController> with AfterInitMixin<ChatPage> {
  String idUser;
  @override
  void didInitState() {
    _getId();
    controller.getMessages(widget.codigoChat);
  }

  _getId()async {
    String id = await DeviceUtils().getId(context);
    setState(() {
      idUser = id;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Cód.  " + widget.codigoChat),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Observer(
                        builder: (_){
                          if(controller.messages.hasError){
                            return Text("Error");
                          }
                          if(controller.messages.data == null){
                            return Center(
                                child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            );
                          }
                          List<Message> messages = controller.messages.data;
                          return ListView.builder(
                            reverse: true,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              return Bubble(messages[index], widget.user, idUser);
                            },
                          );
                        },
                      )
                    )
                  ],
                ),
              ),
            ),
            Observer(
              builder: (_){
                return controller.loading ? LinearProgressIndicator() : Container();
              },
            ),
            TextComposer(
              widget.codigoChat,
              widget.user
            )
          ],
        ),
      ),
    );
  }
}
