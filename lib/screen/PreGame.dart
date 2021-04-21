import 'package:flutter/material.dart';
import 'package:loupgaroutest12/screen/distribution.dart';
import 'Role.dart';
import 'HomeScreen.dart';

class PreGame extends StatefulWidget {
  @override
  List<Role> next;

  PreGame({Key key, @required this.next}) : super(key: key);

  _PreGameState createState() => _PreGameState();
}

class _PreGameState extends State<PreGame> {
  @override
  bool init = true;
  final List<Role> _listRole = [
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

  List<Role> l1 = [];

  @override
  Widget build(BuildContext context) {
    if (init) {
      for (int i = 0; i < _listRole.length; i++) {
        _listRole[i].number = 0;
      }
      ;
      init = false;
    }
    return Scaffold(
      backgroundColor: Color(0xffd2d6d1),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen(
                        next: [],
                      )));
            }),
        backgroundColor: Color(0xff193540),
        // Green
        elevation: 0,
        title: Text(
          "Nombre total de joueurs : ",
          style: TextStyle(
              fontFamily: 'Cinzel', fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                    '${l1.length}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cinzel'),
                  )),
              // players number
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage('assets/images/night.jpg'),
                        colorFilter: ColorFilter.mode(
                            Color(0xff193540), BlendMode.color),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.white.withOpacity(1),
                            Colors.white.withOpacity(0.8),
                            Colors.white.withOpacity(.6),
                            Colors.white.withOpacity(.4),
                            Colors.black.withOpacity(.2),
                            Colors.white.withOpacity(.4),
                            Colors.white.withOpacity(.8),
                            Colors.white.withOpacity(.9),
                          ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FittedBox(
                        fit: BoxFit.fill,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(500, 0, 500, 800),
                          child: Text(
                              "Le nombre de loups doit être le \n tiers du nombre total de joueurs",
                            style: TextStyle(
                                color: Color(0xff193540),
                                fontSize: 550,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Montserrat',
                                wordSpacing: 150),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 110),
                        child: Center(
                          child: FloatingActionButton.extended(
                            heroTag: null,
                            onPressed: () {
                              widget.next = l1;
                              if (widget.next.length < 3) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          title: Text(
                                            "Une erreur s'est produite",
                                            style: TextStyle(
                                                color: Color(0xff405d65),
                                                fontFamily: 'Cairo'),
                                          ),
                                          content: Text(
                                            'Veuillez choisir plus de 2 cartes',
                                            style:
                                            TextStyle(fontFamily: 'Cairo'),
                                          ));
                                    });
                              } else {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            dist(next: widget.next)));
                              }
                            },
                            label: Text(
                              'COMMENCER',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                            backgroundColor: Color(0xffa0220b),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: _listRole
                        .map((item) =>
                        Card(
                          color: Colors.white,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(item.imgpath),
                                    colorFilter: ColorFilter.mode(
                                        Color(0xffd2d6d4).withOpacity(0.9),
                                        BlendMode.colorBurn),
                                    fit: BoxFit.cover)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.0),
                                        Colors.black.withOpacity(.2),
                                        Colors.black.withOpacity(0.5),
                                        Colors.black.withOpacity(.7),
                                        Colors.black.withOpacity(.7),
                                        Colors.black.withOpacity(.4),
                                        Colors.black.withOpacity(.2),
                                        Colors.black.withOpacity(.05),
                                        Colors.black.withOpacity(.1),
                                        Colors.black.withOpacity(.2),
                                        Colors.black.withOpacity(.3),
                                        Colors.black.withOpacity(.6),
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.9),
                                        Colors.black.withOpacity(1),
                                        Colors.black.withOpacity(1),
                                      ])),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 0),
                                    child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Text(
                                          item.name,
                                          style: TextStyle(
                                              fontFamily: 'Cinzel',
                                              fontWeight: FontWeight.w900,
                                              fontSize: 28,
                                              color: Color(0xffffffff)),
                                        )),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 49, 0, 0),
                                          child: Container(
                                            height: 90,
                                            width: 35,
                                            child: FloatingActionButton(
                                              heroTag: null,
                                              onPressed: () {
                                                setState(() {
                                                  if (item.number > 0) {
                                                    item.number -= 1;
                                                    l1.removeWhere((card) => card.name == item.name && card.number == item.number);
                                                    print(l1[l1.length-1].name + l1[l1.length-1].number.toString());
                                                    print(l1.where((card) =>
                                                    (card.name == item.name && card.number == item.number)).toString());
                                                        }
                                                    });

                                              },
                                              child: Icon(
                                                Icons.remove,
                                                size: 35,
                                                color: Colors.white,
                                              ),
                                              backgroundColor: Color(0xffa0220b)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 49, 8, 0),
                                          child: Container(
                                            height: 90,
                                            width: 50,
                                            child: Center(
                                                child: Text(
                                                  "${item.number}",
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontFamily: 'Montserrat'),
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 49, 10, 0),
                                          child: Container(
                                            height: 90,
                                            width: 35,
                                            child: FloatingActionButton(
                                              heroTag: null,
                                              onPressed: () {
                                                setState(() {
                                                  Role itemm = Role(
                                                      imgpath: item.imgpath,
                                                      name: item.name,
                                                      number: item.number,
                                                      camp: item.camp,
                                                      dead: item.dead);
                                                  l1.add(itemm);
                                                  item.number += 1;
                                                });
                                              },
                                              child: Icon(
                                                Icons.add,
                                                size: 35,
                                                color: Colors.white,
                                              ),
                                              backgroundColor: Color(0xff193540)
                                                  .withOpacity(0.6),
                                            ),
                                          ),
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                          ),
                        ))
                        .toList(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
