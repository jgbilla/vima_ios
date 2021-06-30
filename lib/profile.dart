

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget{

  @override

  State<StatefulWidget> createState() => ProfileState();

}

class ProfileState extends State<Profile>{

  @override
  Widget build(BuildContext context) {
    double padding= MediaQuery.of(context).size.height/10;
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,

        child:SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: CupertinoColors.white,
                width:MediaQuery.of(context).size.width/20,
                height: MediaQuery.of(context).size.height/20,
                      child: Image.asset("left-arrow-white.png",
                      width:MediaQuery.of(context).size.width/20,
                          height: MediaQuery.of(context).size.height/20
                      ),
                    ),
                    Container(
                      color: CupertinoColors.white,
                      width:MediaQuery.of(context).size.width/20,
                      height: MediaQuery.of(context).size.height/20,
                      child: Image.asset("settings.png",
                          width:MediaQuery.of(context).size.width/20,
                          height: MediaQuery.of(context).size.height/20
                      ),
                    )

                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: padding),
                      child: Container(
                      width: MediaQuery.of(context).size.width/4,
                        height: MediaQuery.of(context).size.height/4,
                        decoration: BoxDecoration(

                          shape: BoxShape.circle
                        ),
                        child: Image.asset('assets/apple.png',
                            width: MediaQuery.of(context).size.width/5-20,
                            height: MediaQuery.of(context).size.height/5-20),
                      ),
                    ),

Padding(
  padding: const EdgeInsets.only(top:40.0),
  child:   Container(

    height: MediaQuery.of(context).size.height/4,

    child:   Card(

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(5.0)

      ),

      child: Column(

        children: [

              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10.0, right:10.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Text("Nom d'utilisateur"),

                    Text("Jean BILLA")



                  ],

                ),
              ),



              Padding(
                padding: const EdgeInsets.only(top:20.0, left: 10.0, right:10.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Text("Numero de telephone"),

                    Text("63259875")



                  ],

                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:20.0, left: 10.0, right:10.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Text("Adresse"),

                    Text("Karpala Secteur 51")



                  ],

                ),
              ),

        ],

      ),

    ),

  ),
)
                  ],
                ),
              ),
            ],
          ),
        ) );

  }
}