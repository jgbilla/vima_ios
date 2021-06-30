import 'dart:html';

import 'models/models.dart';

class SearchEngine{

  void setSearch(List<Article> articles, List<Shop> shops, String searchedString,
      List<Article> articlesFound, List<Shop> shopsFound, List<String> type, List<int> position){

    List<int> counter = [0,0];

    articlesFound.clear();
    shopsFound.clear();
    type.clear();

    for (int i=0; i<articles.length; i++){
      Article article = articles[i];
      String name = article.name;
      String photo = article.picture;

      if(photo != null && name.toLowerCase().contains(searchedString)){
        type.add("Article");
        articlesFound.add(article);
        counter[0]++;
      }
      if(counter[0] == 3){
        break;
      }
    }

    for (int i=0; i<shops.length; i++){
      Shop shop = shops[i];
      String name = shop.name;
      String photo = shop.photo;
      String location = shop.location;

      if(photo != null && name.toLowerCase().contains(searchedString)){
        type.add("Boutique");
        shopsFound.add(shop);
        counter[1]++;
      }
      if(counter[1] == 2){
        break;
      }
    }

    if(articlesFound.isEmpty && shopsFound.isEmpty){
      type.add("Article");
      Article empty = new Article(
        name: "Aucun article ne repond a votre recherche",
        picture: "gs://delivery-1b761.appspot.com/Coding tools/folder.png"
      );
      articlesFound.add(empty);

    }

  }
}