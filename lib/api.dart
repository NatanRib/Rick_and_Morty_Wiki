import 'package:dio/dio.dart';
import 'package:rm_wiki/models/character.dart';

class Api {

  List chars = List();
  Map info = Map();

  getCharacter(List list)async{

    Response<Map<String, dynamic>> res = await Dio().get('https://rickandmortyapi.com/api/character/');
    
    chars = res.data['results'];
    info = res.data['info'];

    while(info['next'] != null){
      Response<Map<String, dynamic>> res = await Dio().get('${info['next']}');
      // print(res.data['results']);
      chars += (res.data['results']);
      info = res.data['info'];
    }

    for (var i in chars){
      list.add(Character.fromJson(i));
      print(i['name']);
    }
    print('qtd: ${chars.length}');
    return list;
  }

}