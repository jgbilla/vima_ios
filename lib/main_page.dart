import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vima_ios/bag.dart';
import 'package:vima_ios/favoris.dart';
import 'package:vima_ios/home.dart';

class main_page extends StatefulWidget{

  final databaseref = FirebaseDatabase.instance.reference();


  @override
  State<StatefulWidget> createState() => _mainPageState();
}

class _mainPageState extends State<main_page>{


  List<Widget> tabs =[
    Home(),
    favoris(),
    bag(),
  ];



  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), title: Text("Acceuil")),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart), title: Text("Favoris")),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bag), title: Text("Boutiques")),
          ],
        ),
        tabBuilder: (context, index){
          switch(index){
            case 0:
              return Home();
              break;

            case 1:
              return favoris();
              break;

            case 2:
              return bag();
              break;
          }
        },
    );
  }
}