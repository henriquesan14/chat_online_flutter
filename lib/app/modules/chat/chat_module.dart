import 'package:app_chat/app/modules/chat/chat_controller.dart';
import 'package:app_chat/app/modules/chat/chat_page.dart';
import 'package:app_chat/app/repositories/chat_repository.dart';
import 'package:app_chat/app/repositories/i_chat.repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChatModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatController(i.get<IChatRepository>())),
        Bind<IChatRepository>((i) => ChatRepository(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
    Router(':id/user/:user', child: (_, args) => ChatPage(args.params['id'], args.params['user'])),
  ];

  static Inject get to => Inject<ChatModule>.of();
}
