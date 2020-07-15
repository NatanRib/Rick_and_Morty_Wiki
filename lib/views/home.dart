import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rm_wiki/controllers/characters_controller.dart';
import 'card_y.dart';

class Home extends StatelessWidget {

  final charactersController = Get.put(CharactersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        title: Text('RM Characters'),
        backgroundColor: Colors.brown[500],

      ),
      body:GetBuilder<CharactersController>(
        builder: (_){
          return _.characters.length == 0 ? Center(child: CircularProgressIndicator(),) : GridView.count(
            primary: true,
            crossAxisCount: 2,
            children: List<Widget>.generate(_.characters.length, (index){
              return GridTile(
                header: Text(_.characters[index].name,
                textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    // decoration: TextDecoration.lineThrough,
                    // decorationStyle: TextDecorationStyle.solid,
                    // decorationThickness: 10
                  ),
                ),
                child: GestureDetector(
                  onTap: () => Get.to(CardY(_.characters[index])),
                  child: Card(
                    child: Image.network('${_.characters[index].image}'),
                    color: Colors.white,
                  ),
                )
              );
            }),
          );
      }) 
    );
  }
}