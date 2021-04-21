import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loupgaroutest12/screen/Killscreen.dart';
import 'package:loupgaroutest12/screen/PreGame.dart';
import 'Role.dart';

class dist extends StatefulWidget {
  @override
  List<Role> next;
  bool initt = true;
  List<int> listt;

  dist({Key key, @required this.next}) : super(key: key);

  _distState createState() => _distState();
}

class _distState extends State<dist> {
  @override
  List<Role> listRole = [
    alien,
    ancien,
    ange,
    barbier,
    capitaine,
    chasseur,
    chevalier,
    chien,
    corbeau,
    cupidon,
    enfant,
    frere,
    glm,
    idiot,
    pere_Infecte,
    jdf,
    juge,
    loup,
    ours,
    pyro,
    renard,
    salva,
    servante,
    sv,
    soeur,
    sorciere,
    voyante
  ];
  AssetImage _imageToShow;
  int i = 0;

  Widget build(BuildContext context) {
    if (widget.initt) {
      widget.listt = new List<int>.generate(widget.next.length, (int index) => index);
      widget.listt.shuffle();
      print(widget.listt);
      widget.initt = false;
      print(widget.listt);
      print(widget.next[0].name);
      _imageToShow =
          AssetImage(listRole.where((card) => card.name == widget.next[widget.listt[0]].name).toList()[0].imgpath);
    };
    void updateImage() {
      setState(() {
        if (true) {
          i = i + 1;
          if (i == widget.next.length) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Killscreen(next: widget.next)));
          }
          ;
          _imageToShow =
              new AssetImage(listRole.where((card) => card.name == widget.next[widget.listt[i]].name).toList()[0].imgpath);
        }
      });
    }

    return Scaffold(
      backgroundColor: Color(0xffd2d6d4),
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => PreGame(next: widget.next)));
              }),
          backgroundColor: Color(0xff193540),
          elevation: 0,
          title: Text("Votre personnage est.. ",
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontFamily: 'Cinzel',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.9,
                  fontSize: 22)),
          centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
              child: Stack(children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image(
                    image: _imageToShow,
                    width: 250,
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient:
                          LinearGradient(begin: Alignment.topRight, colors: [
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.8),
                        Colors.black.withOpacity(.6),
                        Colors.black.withOpacity(.2),
                      ])),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Container(
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        listRole.where((card) => card.name == widget.next[widget.listt[i]].name).toList()[0].name,
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xffd2d6d4),
                          letterSpacing: 3.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cinzel', // Font change
                          //
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: Text(
                    listRole.where((card) => card.name == widget.next[widget.listt[i]].name).toList()[0].camp,
                    style: TextStyle(
                        fontFamily: 'Cinzel',
                        fontSize: 30,
                        color: Color(0xff193540),
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 20, 5),
              child: Text(
                listRole.where((card) => card.name == widget.next[widget.listt[i]].name).toList()[0].desc,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            )
          ],
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
            onPressed: updateImage,
            label: Text(
              "Suivant",
              style: TextStyle(
                  fontSize: 25, color: Colors.black, letterSpacing: 2),
            ),
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffa0220b),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
