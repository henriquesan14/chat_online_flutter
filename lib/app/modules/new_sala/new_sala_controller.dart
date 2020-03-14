import 'package:app_chat/app/models/chat.dart';
import 'package:app_chat/app/repositories/i_chat.repository.dart';
import 'package:mobx/mobx.dart';

part 'new_sala_controller.g.dart';

class NewSalaController = _NewSalaControllerBase with _$NewSalaController;

abstract class _NewSalaControllerBase with Store {

  final IChatRepository chatRepository;

  _NewSalaControllerBase(this.chatRepository);

  @observable
  bool loading = false;


  @action
  Future createSala(Chat chat) async {
    loading = true;
    try{
      await chatRepository.createSala(chat);
    }catch(err){
      print(err);
    }finally{
      loading = false;
    }
  }
}
