import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ArticleModel extends StatefulWidget{

  State<StatefulWidget> createState() => ArticleModelState();
}

class ArticleModelState extends State<ArticleModel>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(

          width: MediaQuery.of(context).size.width-10,
          height: MediaQuery.of(context).size.height/4,
          child: article(context),
        ),
      )



    );
  }
}

Widget article(BuildContext context){
  return CupertinoPageScaffold(
    child: Container(
      width: MediaQuery.of(context).size.width-10,
      height: MediaQuery.of(context).size.height/4,
      child: Card(
        elevation: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

children: [

  Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('categorie_enfant.PNG')
            )
        ),
  ),

  Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text('3500CFA'),
          ),
          Text('T-shirt Jaune'),
          Text('Shop'),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text('T-shirt'),
          )
        ],

  ),

  Padding(
      padding: const EdgeInsets.only(right:15.0),
      child: Icon(CupertinoIcons.hand_thumbsup),
  ),
],
        ),
      ),
    ),
  );
}