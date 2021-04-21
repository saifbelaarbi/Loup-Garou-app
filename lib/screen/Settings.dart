import 'package:flutter/material.dart';
import 'package:loupgaroutest12/app.dart';
import 'HomeScreen.dart';
import 'login.dart';
import 'Role.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  @override
  List<Role> next;

  SettingsScreen({Key key, @required this.next}) : super(key: key);

  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xD2D6D1),
      appBar: AppBar(
          backgroundColor: Color(0xff193540),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomeScreen(next: widget.next)));
              }),
          title: Text(
            'Réglages',
            style: TextStyle(
                fontFamily: 'Cinzel',
                fontWeight: FontWeight.w900,
                fontSize: 22,
                letterSpacing: 2),
          )),
      body: SettingsList(
        //backgroundColor: Color(0xff193540),
        sections: [
          SettingsSection(
            title: 'Général',
            //titleTextStyle: TextStyle(color: Color(0xff193540), fontSize: 40, fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
            tiles: [
              SettingsTile(
                title: 'Language',
                //titleTextStyle: TextStyle(color: Color(0xff405d65), fontFamily: 'Cinzel', fontSize: 15.0, fontWeight: FontWeight.w900),
                subtitle: 'Français',
                //subtitleTextStyle: TextStyle(),
                leading: Icon(Icons.language),
                onPressed: (_) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text(
                              'Désolé,',
                              style: TextStyle(
                                  color: Color(0xff405d65),
                                  fontFamily: 'Cairo'),
                            ),
                            content: Text(
                              'Nous nous excusons de ne supporter que la langue française pour le moment',
                              style: TextStyle(fontFamily: 'Cairo'),
                            ));
                      });
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Compte',
            //titleTextStyle: TextStyle(color: Color(0xff193540), fontSize: 40, fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
            subtitle: Text(
              auth.currentUser.email,
              style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
            ),
            tiles: [
              SettingsTile(
                title: 'Déconnexion',
                //titleTextStyle: TextStyle(color: Color(0xff405d65), fontFamily: 'Cinzel', fontSize: 16.0, fontWeight: FontWeight.w900),
                leading: Icon(Icons.exit_to_app),
                onPressed: (_) async {
                  await auth.signOut();
                  widget.next = [];
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => App(next: widget.next)));
                },
              ),
              SettingsTile(
                title: 'changer le mot de passe',
                //titleTextStyle: TextStyle(color: Color(0xff405d65), fontFamily: 'Cinzel', fontSize: 16.0, fontWeight: FontWeight.w900),
                leading: Icon(Icons.autorenew),
                onPressed: (_) async {
                  await auth.sendPasswordResetEmail(
                      email: auth.currentUser.email.toString());
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text(
                              'Terminé!',
                              style: TextStyle(
                                  color: Color(0xff405d65),
                                  fontFamily: 'Cairo'),
                            ),
                            content: Text(
                              'Un e-mail de réinitialisation du mot de passe a été envoyé à votre adresse e-mail!',
                              style: TextStyle(fontFamily: 'Cairo'),
                            )); //CHANGELATER
                      });

                  //Navigator.of(context).push(MaterialPageRoute(
                  //  builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Divers',
            //titleTextStyle: TextStyle(color: Color(0xff193540), fontSize: 40, fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
            tiles: [
              SettingsTile(
                title: """Conditions d'utilisation""",
                leading: Icon(Icons.description),
                // onPressed: (_){
                // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CHANGETHIS()));
                //},
                //titleTextStyle: TextStyle(color: Color(0xff405d65), fontFamily: 'Cinzel', fontSize: 15.0, fontWeight: FontWeight.w900),
              ),
              SettingsTile(
                title: 'Nous contacter',
                //titleTextStyle: TextStyle(color: Color(0xff405d65), fontFamily: 'Cinzel', fontSize: 15.0, fontWeight: FontWeight.w900),
                leading: Icon(Icons.add_comment_outlined),
                onPressed: (_) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text(
                              """s'il vous plaît contactez""",
                              style: TextStyle(
                                  color: Color(0xff405d65),
                                  fontFamily: 'Cairo'),
                            ),
                            content: Text(
                                'Loup_Garou_app@supcom.tn')); //CHANGELATER
                      });

                  //Navigator.of(context).push(MaterialPageRoute(
                  //  builder: (BuildContext context) => LanguagesScreen()));
                },
              ),
            ],
          ),
          CustomSection(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22, bottom: 8),
                  child: Image.asset(
                    'assets/settings.png',
                    height: 50,
                    width: 50,
                    color: Color(0xFF777777),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
