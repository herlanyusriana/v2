import 'package:flutter/material.dart';
import 'package:intro_app/login.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';

class IntroPage extends StatelessWidget {
  final pages = [
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      bubbleBackgroundColor: Colors.indigo,
      title:  Container(),
      body: Column(
        children: <Widget>[
          Text ("Hello"),
          Text(
            "Introducing PPI APP"
          )
        ],
      ),
      mainImage: Image.asset(
        'images/book.png',
        width: 285.0,
        height: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black54)
    ),



    PageViewModel(
    pageColor: Color(0xF6F6F7FF),
    iconColor: null,
    bubbleBackgroundColor: Colors.indigo,
    title: Container(),
    body: Column(
      children: <Widget>[
        Text('Semua dalam genggaman !'),
        Text('Berita, Kalender, Portal, DLL',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16.0
        ),
        ),
      ],
    ),
    mainImage: Image.asset(
      'images/bus.png',
      width: 200.0,
      height: 200.0,
      alignment: Alignment.center,
    ),
    textStyle: TextStyle(color: Colors.black)
    ),


    PageViewModel(
    pageColor: Color(0xF6F6F7FF),
    iconColor: null,
    bubbleBackgroundColor: Colors.indigo,
    title: Container(),
    body: Column(
      children: <Widget>[
        Text('Thank you!'),
        Text('Once you stop learning, you start dying.',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16.0
        ),
        ),
      ],
    ),
    mainImage: Image.asset(
      "images/pict.jpg",
      width: 200.0,
      height: 200.0,
      alignment: Alignment.center,
    ),
    textStyle: TextStyle(color: Colors.black)
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                  return LoginPage();  
                  }
                ));
              },
              showSkipButton: true,
              doneText: Text('Login'),
              pageButtonsColor: Colors.indigo,
              pageButtonTextStyles: new TextStyle(
                fontSize: 16.0,
              ),
            )
            
          ],
        ),
      ),
      
    );
  }
}