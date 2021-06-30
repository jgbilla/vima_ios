
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/models.dart';



class Article_Shop extends StatefulWidget{

  State<StatefulWidget> createState() => Article_ShopState();
}

class Article_ShopState extends State<Article_Shop>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(

            width: MediaQuery.of(context).size.width-10,
            child: Column(

              children: [
                Row(
                  children: [

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: article(context),
                )
              ],
            ) ,
          ),
        )



    );
  }
}

Widget article(BuildContext context){

  return CupertinoPageScaffold(
    child: Card(
      elevation: 10.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Container(
            width: 150,
            height: MediaQuery.of(context).size.height/4,
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
  );
}

Widget article_double(BuildContext context, Article article){
  double total_width = (MediaQuery.of(context).size.width-20)/2;

  return Container(
    width: total_width,
    child: Card(
        elevation: 10.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(article.picture)
                  )
              ),
            ),

            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(article.price),
                ),
                Text(article.name),
                Text(article.shopName),

              ],

            ),

            Padding(
              padding: const EdgeInsets.only(right:15.0),
              child: Icon(CupertinoIcons.hand_thumbsup),
            ),
          ],
        ),
      ),
  );


}

Widget article_triple(BuildContext context, List<Article> articles, int index){
  double total_width = (MediaQuery.of(context).size.width-33)/3;
  StorageReference storage = FirebaseStorage.instance.getReferenceFromUrl(articles[index].picture) as StorageReference;
  String link = storage.getDownloadURL().toString();



  return Container(
    
    width: total_width,
    height: 150,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      elevation: 10.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Column(
            children: [

              Text(articles[index].name),
              Text(articles[index].shopName),

            ],

          ),

          Container(
            width: total_width,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(link)
                )
            ),
          ),



        ],
      ),
    ),
  );


}

Widget shop_triple(BuildContext context, List<Shop> articles, int index){
  double total_width = (MediaQuery.of(context).size.width-33)/3;
  StorageReference storage = FirebaseStorage.instance.getReferenceFromUrl(articles[index].photo) as StorageReference;
  String link = storage.getDownloadURL().toString();



  return Container(

    width: total_width,
    height: 150,
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      elevation: 10.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Column(
            children: [

              Text(articles[index].name),

            ],

          ),

          Container(
            width: total_width,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(link)
                )
            ),
          ),



        ],
      ),
    ),
  );


}