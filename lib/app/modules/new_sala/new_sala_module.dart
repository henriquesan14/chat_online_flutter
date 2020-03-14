
import 'package:app_chat/app/modules/new_sala/new_sala_controller.dart';
import 'package:app_chat/app/modules/new_sala/new_sala_page.dart';
import 'package:app_chat/app/repositories/chat_repository.dart';
import 'package:app_chat/app/repositories/i_chat.repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewSalaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NewSalaController(i.get<IChatRepository>())),
        Bind<IChatRepository>((i) => ChatRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => NewSalaPage()),
  ];

  static Inject get to => Inject<NewSalaModule>.of();
}
