import 'package:flutter/material.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: RotatedBox(
              quarterTurns: 2,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Colors.blueAccent,Colors.blueAccent.shade200],
                    [Colors.blue,Colors.blue.shade200],
                  ],
                  durations: [19440, 10800],
                  heightPercentages: [0.20,0.25],
                  blur: MaskFilter.blur(BlurStyle.solid, 10),
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight
                ),
                waveAmplitude: 0,
                size: Size(double.infinity, double.infinity),
              ),
            ),
          ),
          ListView(
            children: <Widget>[
              Container(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Login', textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                    ),),
                    Card(
                      margin: EdgeInsets.only(left: 30,right: 30,top: 30),
                      elevation: 11,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.black26,),
                          suffixIcon: Icon(Icons.check_circle, color: Colors.black26),
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.black26),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30,right: 30,top: 30),
                      elevation: 11,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.black26,),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black26),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        color: Colors.blue,
                        onPressed: (){},
                        elevation: 11,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                        child: Text('Login', style: TextStyle(
                          color: Colors.white70
                        ),),
                      ),
                    )

                  ],
                ),
              )
            ],
          )
        ],
      ),
      
    );
  }
}