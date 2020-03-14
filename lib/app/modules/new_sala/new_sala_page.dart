import 'package:app_chat/app/models/chat.dart';
import 'package:app_chat/app/modules/new_sala/new_sala_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewSalaPage extends StatefulWidget {
  final String title;
  const NewSalaPage({Key key, this.title = "Nova sala / Sala existente"}) : super(key: key);

  @override
  _NewSalaPageState createState() => _NewSalaPageState();
}

class _NewSalaPageState extends ModularState<NewSalaPage, NewSalaController> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _focusCodigo = FocusNode();
  final Chat chat = Chat();
  String user = "";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: TextFormField(
                  onChanged: (value) {
                    user = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Informe seu nickname";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Theme.of(context).primaryColor)),
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                    hintText: "Nickname",
                  ),
                  keyboardType: TextInputType.text,
                  enabled: !controller.loading,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (term){
                      FocusScope.of(context).requestFocus(_focusCodigo);
                   },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: TextFormField(
                  focusNode: _focusCodigo,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (term) async {
                        if (_formKey.currentState.validate()) {
                          await controller.createSala(chat);
                          Navigator.pushNamed(context, 'chat/${chat.codigo}/user/$user');
                        }
                    },
                    onChanged: (value) {
                      chat.codigo = value;
                    },
                    style: TextStyle(),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Informe o código para a sala";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 3)),
                      suffixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.grey,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                      hintText: "Código da sala",
                    ),
                    keyboardType: TextInputType.text,
                    enabled: !controller.loading),
              ),
              SizedBox(
                height: 20,
              ),
              Observer(
                builder: (_) {
                  return Container(
                    height: 60,
                    child: RaisedButton(
                      ///
                      child: controller.loading
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : Text(
                              "Confirmar sala",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await controller.createSala(chat);
                          Navigator.pushNamed(context, 'chat/${chat.codigo}/user/$user');
                        }
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
