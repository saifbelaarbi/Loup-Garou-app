import 'package:flutter/material.dart';
import 'package:loupgaroutest12/screen/SplashScreen.dart';
import 'package:loupgaroutest12/screen/Role.dart';

class App extends StatelessWidget {
  @override
  List<Role> next=[];

  App({Key key, @required this.next}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login App',
        theme: ThemeData(accentColor: Colors.blue, primarySwatch: Colors.red),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(next : next));
  }
}
