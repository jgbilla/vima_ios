import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vima_ios/article_model.dart';
import 'package:vima_ios/bag_boutiques.dart';
import 'package:vima_ios/bag_populaires.dart';
import 'package:vima_ios/bag_recents.dart';
import 'package:vima_ios/home.dart';

import 'article_in_shop.dart';

class bag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => bagState();
}

class bagState extends State<bag> with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool _folded = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CupertinoColors.white,

        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: false,
                backgroundColor: CupertinoColors.white,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    children: [
                      PreferredSize(
preferredSize: Size(double.infinity, 150),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                      child: Text(
                                        "VIMA",
                                        style: TextStyle(
                                          color: CupertinoColors.white,
                                          fontSize: 25.0,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "VIMA",
                                        style: TextStyle(
                                          color: CupertinoColors.black,
                                          fontSize: 25.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15.0),
                                        child: Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'categorie_enfant.PNG'))),
                                        )),

                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center,
                            children: [
                              AnimatedContainer(
                                duration: Duration(
                                    milliseconds: 400),
                                width: _folded ? 56 : 300,
                                height: 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius
                                        .circular(32),
                                    color: Colors.white,
                                    boxShadow: kElevationToShadow[6]),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 16),
                                          child: !_folded
                                              ? CupertinoTextField(
                                            placeholder: "Recherchez",
                                            placeholderStyle:
                                            TextStyle(color: Colors
                                                .black),
                                            decoration: BoxDecoration(),
                                          )
                                              : null,
                                        )),
                                    AnimatedContainer(
                                      duration: Duration(
                                          milliseconds: 400),
                                      child: Material(
                                        type: MaterialType
                                            .transparency,
                                        child: InkWell(
                                          borderRadius: BorderRadius
                                              .only(
                                            topLeft:
                                            Radius.circular(
                                                _folded ? 32 : 0),
                                            topRight: Radius
                                                .circular(32),
                                            bottomLeft:
                                            Radius.circular(
                                                _folded ? 32 : 0),
                                            bottomRight: Radius
                                                .circular(32),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets
                                                .all(16.0),
                                            child: Icon(
                                                _folded
                                                    ? CupertinoIcons
                                                    .search
                                                    : CupertinoIcons
                                                    .xmark_circle_fill,
                                                color: Colors
                                                    .red[900]),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _folded = !_folded;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                                ],
                                ),
                        ),

                              ],
                            ),
                          ]
                          ),

                          ),
                      )
                      )


                    ]

                  ),

                ),
                expandedHeight: 200.0,
                bottom: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: CupertinoColors.systemPink,
                  ),
                  tabs: [
                    Tab(
                        child: Text(
                          'Boutiques',
                          style: TextStyle(color: CupertinoColors.black),
                        )),
                    Tab(
                        child: Text(
                          'Recents',
                          style: TextStyle(color: CupertinoColors.black),
                        )),
                    Tab(
                        child: Text(
                          'Populaires',
                          style: TextStyle(color: CupertinoColors.black),
                        ))
                  ],
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: CupertinoColors.systemRed,
                  controller: _tabController,
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,

            children: [
              bag_boutiques(),
              bag_recents(),
              bag_populaires(),
            ],
          ),
        )
    );
  }
}
Widget boutiques(BuildContext context){
  return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
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
                    image: AssetImage('dummy_celio_image.png')
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Celio"),

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Text("Ouaga 2000"),

                  ],
                ),
              ],
            ),
          ),
        ),
      )
  );
}

Widget article(BuildContext context){
  return CupertinoPageScaffold(
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
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
    ),
  );
}


