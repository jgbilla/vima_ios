import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vima_ios/article_page.dart';
import 'package:vima_ios/profile.dart';
import 'package:vima_ios/search_engine.dart';
import 'package:vima_ios/shop_page.dart';

import 'Getting_data.dart';
import 'article_in_shop.dart';
import 'models/models.dart';

class Datarequired {

  List<Article> articles;
  List<Shop> shops;

  Datarequired({
    this.articles,
    this.shops
  });
}
Future<Datarequired> _fetch() async{
  return Datarequired(
      articles: await Fetching().ReadArticleData(),
      shops: await Fetching().ReadShopData(),
  );
}



class Home extends StatefulWidget{

 @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _folded = true;
  Future<Datarequired> _dataRequired;


  final myController = TextEditingController();
  DatabaseReference database = FirebaseDatabase.instance.reference();
  List<Article> articlesList = [];
  List<Shop> shopsList = [];
  List<String> typeList = [];
  List<int> positionList = [];
  SearchEngine search = new SearchEngine();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataRequired =_fetch();
  }
  @override
  void dispose(){
    myController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),

        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Center(
                    child: Text("ACCUEIL", style:
                    TextStyle(color: CupertinoColors.systemGrey,
                        fontSize: 25.0),),
                  ),
                ),
                Center(child: Text("VIMA", style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 25.0),)),
                Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context,
                            new MaterialPageRoute(builder: (context) => Profile()));
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('categorie_enfant.PNG')
                            )
                        ),

                      ),
                    )
                )

              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<Datarequired>(
        future: _dataRequired,
        builder: (context, snapshot) {
          return snapshot.hasData
            ? homeView(snapshot.data.articles, snapshot.data.shops)

          // By default, show a loading spinner.
          : CircularProgressIndicator();
        }
    ),

      );



     /* CupertinoPageScaffold(
          child: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          width: _folded ? 56 : 300,
                          height: 56,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.white,
                              boxShadow: kElevationToShadow[6]),

                          child: Row(
                            children: [
                              Expanded(child: Container(
                                padding: EdgeInsets.only(left: 16),
                                child: !_folded ?
                                CupertinoTextField(
                                  placeholder: "Recherchez",
                                  placeholderStyle: TextStyle(
                                      color: Colors.black
                                  ),
                                  decoration: BoxDecoration(
                                  ),

                                )
                                    : null,
                              )),

                              AnimatedContainer(
                                duration: Duration(milliseconds: 400),
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(_folded ? 32 : 0),
                                      topRight: Radius.circular(32),
                                      bottomLeft: Radius.circular(_folded ? 32 : 0),
                                      bottomRight: Radius.circular(32),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(
                                          _folded ? CupertinoIcons.search : CupertinoIcons
                                              .xmark_circle_fill, color: Colors.red[900]),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _folded = !_folded;
                                      });
                                    },),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height/2,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Image.asset("left-arrow.png",
                          width:50,
                          height:50),
                               Stack(
                                 alignment: AlignmentDirectional.center,
                                children: [
                                      Image.asset("dummy_image_2.png",
                                      height:MediaQuery.of(context).size.height/2,
                                        width:MediaQuery.of(context).size.width-150 ,),

                                   Center(
                                     child: Text("Hello",
                                  style: TextStyle(
                                      fontSize: 25,
                                  ),),
                                   )
                                ],
                              ),
                            Image.asset("right-arrow.png",
                                width:50,
                                height:50),

                          ],
                        ),
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("POPULAIRES",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                              Text("Voir tout")
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              children: [
                                article_triple(context),
                                article_triple(context),
                                article_triple(context),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("NOUVEAUTES",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                              Text("Voir tout")
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              children: [
                                article_triple(context),
                                article_triple(context),
                                article_triple(context),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30.0,bottom: 30.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("BOUTIQUES",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                              Text("Voir tout")
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              children: [
                                article_triple(context),
                                article_triple(context),
                                article_triple(context),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),*/
      

  }
  Widget homeView (List<Article> articles, List<Shop> shops){

    return CupertinoPageScaffold(
      child: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      width: _folded ? 56 : 300,
                      height: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.white,
                          boxShadow: kElevationToShadow[6]),

                      child: Row(
                        children: [
                          Expanded(child: Container(
                            padding: EdgeInsets.only(left: 16),
                            child: !_folded ?
                            CupertinoTextField(
                              controller: myController,
                              placeholder: "Recherchez",
                              placeholderStyle: TextStyle(
                                  color: Colors.black
                              ),
                              decoration: BoxDecoration(
                              ),
onChanged: (text){
                                if(text.toString().isNotEmpty){
                                  search.setSearch(articles, shops, text.toString(), articlesList, shopsList, typeList, positionList);

                                  return ListView.builder(
                                    itemCount: articlesList.length + shopsList.length,
                                      itemBuilder: (BuildContext context, int index){

                                      if(typeList[index] == "Article"){
                                        StorageReference storage = FirebaseStorage.instance.getReferenceFromUrl(articles[index].picture) as StorageReference;
                                        String link = storage.getDownloadURL().toString();
                                        return GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => ArticlePage(article: articlesList[index],)));
                                          },
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
                                                        image: NetworkImage(link)
                                                    )
                                                ),
                                              ),

                                              Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 20.0),
                                                    child: Text(articles[index].price),
                                                  ),
                                                  Text(articlesList[index].name),
                                                  Text(articles[index].shopName),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 20.0),
                                                    child: Text(typeList[index]),
                                                  )
                                                ],

                                              ),

                                            ],
                                          ),
                                        );
                                      }

                                        StorageReference storage = FirebaseStorage.instance.getReferenceFromUrl(shops[index].photo) as StorageReference;
                                        String link = storage.getDownloadURL().toString();
                                        return GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => ShopPage(shop: shopsList[index],)));
                                          },
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
                                                        image: NetworkImage(link)
                                                    )
                                                ),
                                              ),

                                              Column(
                                                children: [

                                                  Text(shopsList[index].name),

                                                  Padding(
                                                    padding: EdgeInsets.only(top: 20.0),
                                                    child: Text(typeList[index]),
                                                  )
                                                ],


                                              ),

                                            ],
                                          ),
                                        );
                                      });
                                }
                                else{
                                  articlesList.clear();
                                  shopsList.clear();
                                }

},
                            )
                                : null,
                          )),

                          AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            child: Material(
                              type: MaterialType.transparency,
                              child: InkWell(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(_folded ? 32 : 0),
                                  topRight: Radius.circular(32),
                                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                                  bottomRight: Radius.circular(32),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(
                                      _folded ? CupertinoIcons.search
                                          : CupertinoIcons.xmark_circle_fill, color: Colors.red[900]),
                                ),
                                onTap: () {
                                  myController.clear();
                                  setState(() {
                                    _folded = !_folded;
                                  });

                                },),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("left-arrow.png",
                            width:50,
                            height:50),
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.asset("dummy_image_2.png",
                              height:MediaQuery.of(context).size.height/2,
                              width:MediaQuery.of(context).size.width-150 ,),

                            Center(
                              child: Text("Hello",
                                style: TextStyle(
                                  fontSize: 25,
                                ),),
                            )
                          ],
                        ),
                        Image.asset("right-arrow.png",
                            width:50,
                            height:50),

                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("POPULAIRES",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          Text("Voir tout")
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [
                            article_triple(context,articles,0),
                            article_triple(context,articles,1),
                            article_triple(context,articles,2),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("NOUVEAUTES",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          Text("Voir tout")
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [
                            article_triple(context,articles,3),
                            article_triple(context,articles,4),
                            article_triple(context,articles,5),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30.0,bottom: 30.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("BOUTIQUES",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          Text("Voir tout")
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          children: [
                            shop_triple(context,shops,0),
                            shop_triple(context,shops,0),
                            shop_triple(context,shops,0),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }
}
