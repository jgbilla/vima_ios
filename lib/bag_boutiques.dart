import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vima_ios/article_alone.dart';
import 'package:vima_ios/article_in_shop.dart';
import 'package:vima_ios/article_model.dart';
import 'package:vima_ios/bag.dart';
import 'package:vima_ios/main_page.dart';
import 'package:vima_ios/shop_page.dart';

import 'Getting_data.dart';
import 'home.dart';
import 'models/models.dart';

Future<Datarequired> _fetch() async{
  return Datarequired(
    articles: await Fetching().ReadArticleData(),
    shops: await Fetching().ReadShopData(),
  );
}


class bag_boutiques extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _bag_boutiquesState();
}

class _bag_boutiquesState extends State<bag_boutiques>{

  int state =0;
  Future<Datarequired> _dataRequired;

  @override
  void initState() {
    // TODO: implement initState
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
                      return boutiques(snapshot.data.shops[index]);
                })

                // By default, show a loading spinner.
                    : CircularProgressIndicator();
              }
          ),
         );
  }

  Widget boutiques(Shop shop){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ShopPage(shop
                : shop,)));
      },
      child: CupertinoPageScaffold(
          child: Padding(
            padding:  EdgeInsets.only(top: 10.0),
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),

              child: Container(
                width: MediaQuery.of(context).size.width-10,
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(shop.photo)
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(shop.name),

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        Text(shop.location),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}