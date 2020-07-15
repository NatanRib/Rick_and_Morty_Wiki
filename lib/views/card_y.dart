import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rm_wiki/models/character.dart';

class CardY extends StatelessWidget {
  
  Character char;
  
  CardY(this.char);

  details(Character c){
    return AlertDialog(
      backgroundColor: Colors.purple[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      title: Text('Name: ${char.name}'),
      content: Text('Gender: ${char.gender}\n' + 
      'Status: ${char.status}\nSpecie: ${char.species}\nOrigin: ${char.origin}' +
      '\nLast location: ${char.lastLoc}\nType: ${char.type}'),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      // appBar: AppBar(
      //   backgroundColor: Colors.brown[500],
      //   title: Text('Carta'),
      // ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: Get.height * 0.04,
            child: Container(
              height: Get.height - Get.height * 0.04,
              width: Get.width,
              // decoration: BoxDecoration(
              //   image: DecorationImage(image: AssetImage('res/img/cartayugioh.png', ))
              // ),
              child: Image.asset('res/img/carta.png',
                fit: BoxFit.fill
              ),
            ),
          ),
          char.name.trim().length > 12 ?
          Positioned(
            left: Get.width/3.3,
            top: Get.height/8,
            child: Text('${char.name}',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            )
          ) :
          Positioned(
            left: Get.width/1.75,
            top: Get.height/8,
            child: Text('${char.name}',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            )
          ),
          Positioned(
            top: Get.height/5.38,
            left: Get.width/8.4,
            child: Container(
              width: Get.width/1.3,
              height: Get.height/1.6,
              child: Image.network('${char.image}',
                fit: BoxFit.cover,
              )
            )
          ),
          Positioned(
            top: Get.height / 1.2,
            left: Get.width / 9,
            child: Text('Gender: ${char.gender}\nOrigin: ${char.origin}',
              style: TextStyle(
                color: Colors.black
              ),
            ) 
          ),
          Positioned(
            top: Get.height/ 1.1,
            left: Get.width/2.4,
            child: GestureDetector(
              onTap: () => Get.dialog(details(char)),
              child: Text('More info',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline
                ),
              ),
            )
          ),
          Positioned(
            top: Get.height / 11,
            right: Get.width/1.3,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios,
              size: 30,
                color: Colors.purple[800],
              ),
              onPressed: () => Get.back()
            ) 
          )
        ],
      )
    );
  }
}