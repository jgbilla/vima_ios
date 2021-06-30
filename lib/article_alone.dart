import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ArticleAlone extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('dummy_image_1.png')
              )
          ),

          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width-20,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                  ),
                  child: Center(
                    child: Text('Test', style: TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 30.0,
                    ),),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}