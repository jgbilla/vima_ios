import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vima_ios/models/models.dart';

class Fetching {


  List<Shop> shop_data = [];
  bool isShopDataFetched = false;

  List<Shop> HomeShopData = [];
  List<Article> HomeArticleData = [];
  bool isHomeShopDataFetched = false;
  bool isHomeArticleDataFetched = false;

  List<Article> article_data = [];
  bool isArticleDataFetched = false;
  List articles_temp_lists = [];
  List shops_temp_lists = [];

  Shop final_shop = new Shop();

  Future<List<Article>> ReadArticleData() async {
    ReadShopData();
    final ref = FirebaseDatabase.instance.reference();




    await ref.child("Articles").once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> map = snapshot.value;
      map.remove("counter");

      if (map.isNotEmpty) {
        for (var value in map.values) {
          for(var shop in shop_data) {
            if (shop.name == value['shop_name'].toString()) {
               final_shop = shop;
            }
          }
          article_data.add(Article(
              name: value["name"].toString(),
              price: value["price"].toString(),
              picture: value["p_photo"].toString(),
            shopName: value['shop_name'].toString(),
            shop: final_shop

          ));
        }
      }
    });
    return article_data;
  }

  Future<List<Shop>> ReadShopData() async {
    final ref = FirebaseDatabase.instance.reference();
    ReadArticleData();

    await ref.child("Shops").once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> map = snapshot.value;
      map.remove("counter");
      print(map);

      if (map.isNotEmpty) {
        for (var value in map.values) {

          Map<dynamic, dynamic> articles = value["Articles"];
          print(articles);
          List<String> titles = [];
          List list_of_index = [];
          List<Article> list =[];
          articles.forEach((key, value) {
            titles.add(key);

            for(var i=1; i<30; i++){
              if(i<=value.length-1){

                list_of_index.add(value[i]);
              }
            }

          });
          for (int i=0; i<list_of_index.length; i++){
            list.add(article_data[i]);
          }
          shop_data.add(Shop(
            name: value["name"].toString(),
            location: value["location"].toString(),
            phone_number: value["phoneNumber"].toString(),
            description: value["description"].toString(),
            photo: value["p_photo"].toString(),
            articles: list,
            titles: titles

          ));

        }

      }
    });
    return shop_data;
  }
}


/*void CleanData(DataSnapshot shops, DataSnapshot articles){
     DataSnapshot workSnapshot = shops;
     shop_data.clear();
     Shop currentShop;
     int shopCounter = int.parse(workSnapshot.value["counter"].toString());

     int counterA = 1
     if(workSnapshot.data.value.length)



  }*/

/*Stream<List<Article>> getArticleData (){
     final ref = FirebaseDatabase.instance.reference();
     List<Article> fin = [];

     ref.child("Articles").once().then((DataSnapshot snapshot) {

       Map<dynamic,dynamic> map = snapshot.value;

       if(map.isNotEmpty){
         map.forEach((key, value) {
           article_data.add(Article.fromJson(value));
         });
       }
       print(article_data[0].name);
       return article_data;

     });
     fin = article_data;
     return fin;*/





