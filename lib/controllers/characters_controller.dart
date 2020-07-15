import 'package:get/state_manager.dart';
import '../api.dart';

class CharactersController extends GetxController{

  List characters = List();

  @override
  void onInit() {
    fetchChars();
    super.onInit();
  }

  fetchChars() async{
    characters = await Api().getCharacter(characters);
    update();
  }


}