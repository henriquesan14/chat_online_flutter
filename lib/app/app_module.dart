import 'package:app_chat/app/repositories/chat_repository.dart';
import 'package:app_chat/app/app_controller.dart';
import 'package:app_chat/app/modules/chat/chat_module.dart';
import 'package:app_chat/app/modules/new_sala/new_sala_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:app_chat/app/app_widget.dart';
import 'package:app_chat/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/newsala', module: NewSalaModule()),
        Router('/chat', module: ChatModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
