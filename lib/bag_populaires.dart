import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vima_ios/article_alone.dart';
import 'package:vima_ios/article_in_shop.dart';
import 'package:vima_ios/article_model.dart';
import 'package:vima_ios/bag.dart';
import 'package:vima_ios/main_page.dart';

import 'Getting_data.dart';
import 'bag_boutiques.dart';
import 'home.dart';
import 'models/models.dart';


Future<Datarequired> _fetch() async{
  return Datarequired(
    articles: await Fetching().ReadArticleData(),
    shops: await Fetching().ReadShopData(),
  );
}

class bag_populaires extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _bag_populairesState();
}

class _bag_populairesState extends State<bag_populaires>{

  int state =0;

  Future<Datarequired> _dataRequired;

  @override
  void initState() {
    super.initState();
    _dataRequired =_fetch();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

        child: FutureBuilder<Datarequired>(
            future: _dataRequired,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                  itemCount: snapshot.data.shops.length,
                  itemBuilder: (BuildContext context, int index){
                    return article_double(context, snapshot.data.articles[index]);
                  })

              // By default, show a loading spinner.
                  : CircularProgressIndicator();
            }
        ),
    );
  }

}