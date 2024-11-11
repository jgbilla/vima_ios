
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Getting_data.dart';
import 'models/models.dart';


class ArticlePage extends StatefulWidget{
  final Article article;
  ArticlePage({Key key, this.article}) : super(key: key);


  @override
  State<StatefulWidget> createState() => ArticlePageState();
}

class ArticlePageState extends State<ArticlePage>{
  bool pressAttention = false;



  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: MediaQuery.of(context).size.height/1.5,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(widget.article.picture)
                      )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Mixte"),
                    VerticalDivider(
                      color: CupertinoColors.systemGrey,
                      thickness: 2,
                      indent: 20,
                      width: 20,
                    ),
                    Text("Blue"),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  child: Text("Contactez-Nous"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("phone_icon.png")
                          )
                      ),
                    ),

                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("whatsapp_icon.png")
                          )
                      ),
                    ),
                    //Todo: Implement on tap with GestureDetector for the 3 images

                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("sms_icon.png")
                          )
                      ),
                    ),

                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(widget.article.price),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(widget.article.name),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text("Description"),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text("Losremevwjlkn3gjobwn ghibo2jnq t1iogjbq"),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text("Images"),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("dummy_image_1.png")
                          )
                      ),
                    ),

                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("dummy_image_1.png")
                          )
                      ),
                    ),
                    //Todo: Implement getting images from Firebase

                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("dummy_image_1.png")
                          )
                      ),
                    ),

                  ],
                ),

                Container(
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
                                  image: AssetImage(widget.article.shop.photo)
                              )
                          ),
                        ),

                        Column(
                          children: [

                            Text(widget.article.shop.name),
                            Text('Shop'),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(widget.article.shop.location),
                            )
                          ],

                        ),


                      ],
                    ),
                  ),
                ),

                Center(
                  child: CupertinoButton(
                    child:
                    Row(
                      children: [
                        Image.asset("assets/apple.png", width: 20, height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Center(child: Text("Se connecter avec Apple")),
                        ),
                      ],
                    ),
                    color: pressAttention ? CupertinoColors.systemGrey
                    :CupertinoColors.systemRed,
                    onPressed: () {
                      setState(() {
                        pressAttention = !pressAttention;
                      });

                     //Todo: Initialize the liking process
                    },
                  ),
                ),


              ],
            ),
          ),
        )
    );
  }
}