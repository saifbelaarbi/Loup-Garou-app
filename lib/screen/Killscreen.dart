import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:loupgaroutest12/screen/HomeScreen.dart';
import 'package:loupgaroutest12/screen/Voting.dart';
import 'Role.dart';
import 'Settings.dart';

class Killscreen extends StatefulWidget {
  @override
  List<Role> next;

  Killscreen({Key key, @required this.next}) : super(key: key);

  _Killscreen createState() => _Killscreen();
}

class _Killscreen extends State<Killscreen> {
  // ignore: non_constant_identifier_names
  int pl_Num = 0;

  List<double> a = List.filled(/*_listRole.length*/ 27, 0);

  /// niveau d'opacité pour les role morts
  List<double> b = List.filled(/*_listRole.length*/ 27, 0);

  /// 23 doit etre rempplacé par le nombre de joueurs
  List<double> c = List.filled(/*_listRole.length*/ 27, 0);
  List<double> d = List.filled(/*_listRole.length*/ 27, 0);
  List<bool> kill = List.filled(/*_listRole.length*/ 27, true);
  List<String> fabtext = List.filled(/*_listRole.length*/ 27, "TUER");
  List<Color> fabcolor = List.filled(
      /*_listRole.length*/
      27,
      Color(0xffe5232e));

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.next.length; i++) {
      if (widget.next[i].dead == true) {
        a[i] = 0.9;
        b[i] = 0.8;
        c[i] = 0.7;
        d[i] = 0.5;
        fabtext[i] = "RAVIVER";
        fabcolor[i] = Color(0xff405d65);
      }
    }
    return Scaffold(
      backgroundColor: Color(0xffd2d6d1),
      appBar: AppBar(
        backgroundColor: Color(0xff193540),
        elevation: 4.0,
        title: Text("Ferme tes yeux...",
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: 'Cinzel',
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0xffd2d6d1)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          elevation: 50,
                          title: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(bottom: 25),
                                    child: Image.asset(
                                      'assets/images/house.jpg',
                                      height: 100,
                                      width: 100,
                                    )),
                                Text(
                                  """Etes-vous sur de vouloir \n           quitter le jeu ?""",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          content: SingleChildScrollView(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  widget.next = [];
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen(next: widget.next)));
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60.0),
                                      color: Color(0xffe5232e)),
                                  child: Center(
                                      child: Text(
                                    "Oui",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffd2d6d4)),
                                  )),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(20.0)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60.0),
                                    color: Color(0xff193540),
                                  ),
                                  child: Center(
                                      child: Text('Non',
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffd2d6d4)))),
                                ),
                              )
                            ],
                          )));
                    });
              }),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Color(0xffd2d6d1),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SettingsScreen(next: widget.next)));
            },
          ),
        ],
        leading: Icon(
          Icons.nights_stay_outlined,
          color: Color(0xffd2d6d1),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.next.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            color: Color(0xffffffff),
            elevation: 10.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  gradient:
                      LinearGradient(begin: Alignment.bottomRight, colors: [
                    Color(0xffe5232e).withOpacity(a[index]),
                    Color(0xffe5232e).withOpacity(b[index]),
                    Color(0xffe5232e).withOpacity(c[index]),
                    Color(0xffe5232e).withOpacity(d[index]),
                  ])),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 55.0,
                          height: 55.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.blueGrey,
                            backgroundImage:
                                AssetImage(widget.next[index].imgpath),
                          )),
                      SizedBox(
                        width: 15.0,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.next[index].name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Cinzel',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 2.0),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: Text(
                                widget.next[index].camp, // Camp
                                style: TextStyle(
                                  color: Color(0xff405d65),
                                  fontFamily: 'Montserrat',
                                  fontSize: 15.0,
                                ),
                              ),
                            )
                          ]),
                    ],
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            if (widget.next[index].dead == false) {
                              widget.next[index].dead = true;
                              a[index] = 0.9;
                              b[index] = 0.8;
                              c[index] = 0.7;
                              d[index] = 0.5;
                              fabtext[index] = "RAVIVER";
                              fabcolor[index] = Color(0xff405d65);
                              kill[index] = false;
                            } else {
                              widget.next[index].dead = false;
                              a[index] = 0;
                              b[index] = 0;
                              c[index] = 0;
                              d[index] = 0;
                              fabtext[index] = "TUER";
                              fabcolor[index] = Color(0xffe5232e);
                              kill[index] = true;
                            }
                          });
                        },
                        color: fabcolor[index],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Text("${fabtext[index]}",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                letterSpacing: 1.5)),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff193540),
        //shape:  CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        child: FittedBox(
          child: FloatingActionButton.extended(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Voting(next: widget.next)));
            },
            label: Text(
              "Vote",
              style: TextStyle(
                  fontSize: 25, color: Colors.black, letterSpacing: 2),
            ),
            icon: Icon(
              Icons.how_to_vote,
              color: Colors.grey[700],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
