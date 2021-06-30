import 'dart:async';

import 'dart:math';

class Article{

   String name;
   String price;
   String picture;
   String shopName;
   Shop shop;
   bool isLiked = false;

Article ({
     this.name,
  this.price,
  this.picture,
  this.shopName,
  this.shop,
  this.isLiked
});

  Article.fromJson(Map<dynamic, dynamic> data){
    name= data['name'] as String;
    price = data['price'] as String;
    picture = data['p_photo'] as String;
    shopName = data['shop_name'] as String;
}

 Shop getShop (List<Shop> shops){
    for(var shop in shops){
      if(shop.name == shopName){
        return shop;
      }
    }
    return shops[0];
}

}

class Shop{

  String name;
  String photo;
  String location;
  String phone_number;
  String description;
  List<Article> articles;
  List<String> titles;

  Shop({this.name,
  this.photo,
  this.location,
  this.phone_number,
    this.description,
  this.articles,
  this.titles});
}

class FirebaseArticles{



}
