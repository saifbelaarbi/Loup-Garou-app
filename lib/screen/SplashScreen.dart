
import 'dart:async';
import 'Role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:loupgaroutest12/screen/login.dart';
import 'package:loupgaroutest12/screen/wrapper.dart';
import 'package:page_transition/page_transition.dart';




class SplashScreen extends StatefulWidget {
  @override
  List<Role> next;

  SplashScreen({Key key, @required this.next}) : super(key: key);
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4),()=>Navigator.pushReplacement(context, PageTransition(   // Animation time
        child: LoginDirect(next : widget.next ),type: PageTransitionType.leftToRightWithFade
    )) );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300.0,
                width: 300.0,
                child: Lottie.asset('assets/Lottie/34605-lonely-wolf.json'),
              ),
              SizedBox(height: 20.0,),
              Container(
                child: SpinKitFadingFour(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Color(0xff193540) : Color(0xfffada5e) ,
                      ),
                    );
                  },
                  duration: Duration(seconds: 3),

                ),
              ),
            ],
          ),
        ));


  }
}