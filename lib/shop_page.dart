import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vima_ios/profile.dart';

import 'models/models.dart';

class ShopPage extends StatefulWidget{

  final Shop shop;

  ShopPage({Key key, this.shop}): super(key: key);

  @override
  State<StatefulWidget> createState() => ShopPageState();
}

class ShopPageState extends State<ShopPage> with SingleTickerProviderStateMixin{


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

                Center(child: Text(widget.shop.name, style: TextStyle(
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
      body: CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 150,
                height: MediaQuery.of(context).size.height/1.5,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(widget.shop.photo)
                    )
                ),
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
                child: Text("Qui Sommes nous?"),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(widget.shop.description),
              ),


              ListView.builder(
                itemCount: widget.shop.articles.length,
                  itemBuilder: (BuildContext context, int index){
                    return article_double(context, widget.shop.articles[index]);
                  })

            ],
          ),
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

}