import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:vima_ios/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'ProDisplay',
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline3: TextStyle(fontSize: 20.0),
          bodyText1: TextStyle(fontFamily: 'ProDisplay')
        )
      ),
      home: Splashscreen(),
    );
  }
}
Widget _test() {
  return Scaffold(

  );

}

class Splashscreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (context) => login())));
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/logo.png',
                      width: 100.0, height: 400.0)
                ])

          ],
        ));
  }

}

