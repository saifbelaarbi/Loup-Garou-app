import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loupgaroutest12/screen/Rules.dart';
import 'PreGame.dart';
import 'Settings.dart';
import 'Role.dart';

class HomeScreen extends StatelessWidget {
  List<Role> next;

  HomeScreen({Key key, @required this.next}) : super(key: key);
  final Color primary = Colors.grey[400];
  final TextStyle style = TextStyle(
    color: Color(0xff000000),
    fontSize: 30.0,
    fontWeight: FontWeight.w900,
    letterSpacing: 5,
    fontFamily: 'Cinzel'
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Ink(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/nightwolf.jpg'),colorFilter: ColorFilter.mode(Color(0xff193540), BlendMode.color),
                  fit: BoxFit.cover),
              color: primary,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/wolf-silhouette-detailed-tattoo.png',color: Color(0xfffffff),
              ),
              InkWell(
                onTap: () {
                  next=[];
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => PreGame(next: next)));
                },
                splashColor: primary,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Color(0xffd2d6d4).withOpacity(0.8),
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Text(
                      "Nouveau jeu",
                      style: style,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: primary,
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Rules(next : next)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Color(0xffd2d6d4).withOpacity(0.8),
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Text(
                      "Règles",
                      style: style,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => SettingsScreen(next : next)));
                },
                splashColor: primary,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Color(0xffd2d6d4).withOpacity(0.8),
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Text(
                      "Réglages",
                      style: style,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
