import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loupgaroutest12/screen/HomeScreen.dart';
import 'package:loupgaroutest12/screen/Killscreen.dart';
import 'Role.dart';
import 'Settings.dart';
import 'package:loupgaroutest12/funcs/funcs.dart';

class Voting extends StatefulWidget {
  @override
  List<Role> next;

  Voting({Key key, @required this.next}) : super(key: key);

  _Voting createState() => _Voting();
}

class _Voting extends State<Voting> {
  // ignore: non_constant_identifier_names
  int Pl_Num = 0;

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

  List<double> a = List.filled(/*_listRole.length*/ 27, 0);

  /// niveau d'opacité pour les role morts
  List<double> b = List.filled(/*_listRole.length*/ 27, 0);

  /// 23 doit etre rempplacé par le nombre de joueurs
  List<double> c = List.filled(/*_listRole.length*/ 27, 0);
  List<double> d = List.filled(/*_listRole.length*/ 27, 0);

  List<bool> kill = List.filled(/*_listRole.length*/ 27, true);

  List<String> fabtext = List.filled(/*_listRole.length*/ 27, "Kill");
  List<Color> fabcolor = List.filled(
      /*_listRole.length*/
      27,
      Color(0xffe5232e));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd2d6d1),
      appBar: AppBar(
        backgroundColor: Color(0xff193540),
        elevation: 4.0,
        title: Text("Choisis sagement",
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
                            padding: const EdgeInsets.only(top:10.0),
                            child: Column(
                              children: [

                                Container( padding: EdgeInsets.only(bottom: 25),child: Image.asset('assets/images/house.jpg' , height: 100, width: 100,)),
                                Text("""Etes-vous sur de vouloir \n           quitter le jeu ?""",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w700),),
                              ],
                            ),
                          ),
                          content: SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 10.0,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) => HomeScreen(next: widget.next)));
                                    },
                                    child:  Container( width: 100.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(60.0),
                                          color: Color(0xffe5232e)
                                      ),
                                      child: Center(child: Text("Oui", style:  TextStyle( fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Color(0xffd2d6d4)),)),

                                    ),

                                  ),
                                  Padding( padding: EdgeInsets.all(20.0)),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child:  Container(
                                      width: 100.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60.0),
                                        color: Color(0xff193540),
                                      ),
                                      child: Center( child: Text('Non',style:  TextStyle( fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Color(0xffd2d6d4)))),
                                    ),

                                  )
                                ],
                              )
                          )
                      );
                    });

              }),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Color(0xffd2d6d1),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SettingsScreen(next:widget.next)));
            },
          ),
        ],
        leading: Icon(
          Icons.how_to_vote_sharp,
          color: Color(0xffd2d6d1),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.next.length,

        /// nombre de joueurs
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: 55, //MediaQuery.of(context).size.width,
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
              padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 55.0,
                          height: 70.0,
                          //alignment: ,
                          child: CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.blueGrey,
                            backgroundImage:
                                AssetImage(widget.next[index].imgpath),
                          )),
                      SizedBox(
                        width: 5.0,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 15),
                              child: Text(
                                widget.next[index].name,
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontFamily: 'Cinzel',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 75),
                              child: CustomStepper(
                                  lowerLimit: 0,
                                  upperLimit: 100,
                                  stepValue: 1,
                                  iconSize: 35,
                                  value: 0),
                            ),
                          ]),
                    ],
                  ),
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
                  builder: (context) => Killscreen(next: widget.next)));
            },
            label: Text(
              "Dormir!",
              style: TextStyle(
                  fontSize: 25, color: Colors.black, letterSpacing: 2),
            ),
            icon: Icon(
              Icons.nights_stay_outlined,
              color: Colors.grey[700],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
