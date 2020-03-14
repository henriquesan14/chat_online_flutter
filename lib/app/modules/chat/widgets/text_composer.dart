import 'package:app_chat/app/models/message.dart';
import 'package:app_chat/app/modules/chat/chat_controller.dart';
import 'package:app_chat/app/utils/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();

  TextComposer(this.codigoChat, this.user);

  final String codigoChat;
  final String user;
}

class _TextComposerState extends ModularState<TextComposer, ChatController> {
  TextEditingController _msgController = TextEditingController();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Expanded(
            child: TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _msgController,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send,
                    color: _isComposing ? Colors.white : null),
                    onPressed: _isComposing
                        ? () {
                            _sendMessage();
                          }
                        : null,
                  ),
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Escreva algo...",
                ),
                onChanged: (text) {
                  setState(() {
                     _isComposing = text.length > 0;
                  });
                },
              )
        ),
      ],
    ));
  }

  _sendMessage() async {
    String id = await DeviceUtils().getId(context);
    if(_msgController.text.isNotEmpty){
      Message msg = Message();
      msg.user = widget.user;
      msg.message = _msgController.text;
      msg.idUser = id;
      controller.addMessage(widget.codigoChat, msg);
      _msgController.text = "";
      _msgController.clear();
    }
  }


}


