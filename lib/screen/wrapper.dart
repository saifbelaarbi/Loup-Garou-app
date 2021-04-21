import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Role.dart';
import 'package:loupgaroutest12/screen/HomeScreen.dart';
import 'package:loupgaroutest12/screen/login.dart';



class LoginDirect extends StatelessWidget {
  List<Role> next;

  LoginDirect({Key key, @required this.next}) : super(key: key);
  User authuser=FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context)  {
    if(authuser!=null){
      return HomeScreen(next : next);
    }else{
      next = [];
      return LoginPage(next : next);
    }
  }
}
