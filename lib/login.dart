import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vima_ios/Getting_data.dart';
import 'package:vima_ios/article_alone.dart';
import 'package:vima_ios/article_in_shop.dart';
import 'package:vima_ios/article_model.dart';
import 'package:vima_ios/bag.dart';
import 'package:vima_ios/bag_boutiques.dart';
import 'package:vima_ios/main_page.dart';

import 'models/models.dart';

class Datarequired {

  List<Article> articles;

  Datarequired({
    this.articles
  });
}

Future<Datarequired> _fetch() async{
  return Datarequired(
    articles: await Fetching().ReadArticleData()
  );
}

class login extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _loginState();
}

class _loginState extends State<login>{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _signIn = GoogleSignIn();
  FirebaseUser _user;
  Future<Datarequired> _dataRequired;
  int state =0;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataRequired =_fetch();


  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

        child:SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/logo.png',
                  width: 100.0, height: 400.0),

              SafeArea(
                minimum: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
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
                          color: Colors.red,
                          onPressed: () {

                              Fetching().ReadShopData();
                            Navigator.pushReplacement(context,
                                new MaterialPageRoute(builder: (context) => main_page()));
                          },
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0 ),
                      child: CupertinoButton(
                        child:
                        Row(
                          children: [
                            Image.asset("google.png", width: 20, height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Center(child: Text("Se connecter avec Google")),
                            ),
                          ],
                        ),
                        color: Colors.red,
                        onPressed: () async{

signInWithGoogle().then((FirebaseUser user) {
  Navigator.pushReplacement(context,
      new MaterialPageRoute(builder: (context) => main_page()));

}
 );
                        },

                      ),
                    )
                  ],
                ),
              ),



            ],
          ),
        ) );
  }
  Future<FirebaseUser> signInWithGoogle() async{

    final prefs = await SharedPreferences.getInstance();

    GoogleSignInAccount googleSignInAccount = await _signIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    AuthResult authResult = await _auth.signInWithCredential(credential);
    _user =authResult.user;

    assert(!_user.isAnonymous);
    assert(await _user.getIdToken() != null);
    FirebaseUser currentUser = await _auth.currentUser();
    assert(_user.uid == currentUser.uid);
    prefs.setString("Name", _user.displayName);
    prefs.setString("Email", _user.email);
    prefs.setString("Phone", _user.phoneNumber);
    getLocation();

  }

  void getLocation () async{
    final prefs = await SharedPreferences.getInstance();
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled = await location.requestService();
          if(!_serviceEnabled){

          }
    }
    _permissionGranted = await location.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await location.requestPermission();
      if(_permissionGranted != PermissionStatus.granted){

      }
    }
    _locationData = await location.getLocation();


    final coordinates = new Coordinates(_locationData.latitude, _locationData.longitude);
    var adresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = adresses.first;

    prefs.setString("Location",first.toString());


  }
}