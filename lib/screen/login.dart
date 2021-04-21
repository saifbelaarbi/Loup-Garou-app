import 'package:flutter/material.dart';
import 'Role.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loupgaroutest12/screen/HomeScreen.dart';
void main() => runApp(new MyApp(next: [],));
FirebaseAuth auth = FirebaseAuth.instance;

class MyApp extends StatelessWidget {
  @override
  List<Role> next;

  MyApp({Key key, @required this.next}) : super(key: key);
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Our login',
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new LoginPage(next : next),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  List<Role> next;

  LoginPage({Key key, @required this.next}) : super(key: key);
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  FormType _form = FormType.login;

  _LoginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  void _formChange() async {
    setState(() {
      if (_form == FormType.register) {
        _form = FormType.login;
      } else {
        _form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background-loup.jpg'),
                fit: BoxFit.cover)),
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return new Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: new Column(
        children: <Widget>[
          new Text(
            'LOUP GAROU -THE GAME-',
            style: TextStyle(fontSize: 22.0),
          ),
          SizedBox(height:5),
          new Image.asset("assets/images/wolf-silhouette-detailed-tattoo.png"),

          new Container(
              child: new Theme(
            data: new ThemeData(
              primaryColor: Colors.white,
              primaryColorDark: Colors.white,
            ),
            child: new TextField(
              controller: _emailFilter,
              style: TextStyle(color: Colors.white,fontSize: 22),
              decoration: new InputDecoration(labelText: 'Email'),
            ),
          )),
          SizedBox(height: 0,),
          new Container(
              child: new Theme(
            data: new ThemeData(
              primaryColor: Colors.white,
              primaryColorDark: Colors.white,
            ),
            child: new TextField(
              controller: _passwordFilter,
              style: TextStyle(color: Colors.white,fontSize: 20),
              decoration: new InputDecoration(labelText: 'Mot de passe',),
              obscureText: true,
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildButtons() {
    if (_form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: _loginPressed,
            ),
            new FlatButton(
              child: new Text("Vous n'avez pas de compte? Appuyez ici.",
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              onPressed: _formChange,
            ),
            new FlatButton(
              child: new Text('Mot de passe oublié?',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              onPressed: _passwordReset,
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text("Créer un compte"),
              onPressed: _createAccountPressed,
            ),
            new FlatButton(
              child: new Text('Avez un compte? Cliquez ici.',
                  style: TextStyle(color: Colors.white, fontSize: 16.0)),
              onPressed: _formChange,
            )
          ],
        ),
      );
    }
  }

  void _loginPressed() async {
    String errorMessage;

    try {
      await auth.signInWithEmailAndPassword(email: _email, password: _password);
      widget.next=[];
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen(next : widget.next)));
    } on FirebaseAuthException catch (error) {
      print(error.code);
      print(error.code);
      print(error.message);
      print(error.message);
      print(error.code);
      print(error.code);
      switch (error.code) {
        case "wrong-password":
          errorMessage = "Votre mot de passe est incorrect";
          break;
        case "user-not-found":
          errorMessage = "L'utilisateur avec cet e-mail n'existe pas.";
          break;
        case "too-many-requests":
          errorMessage = "Trop de demandes. Réessayez plus tard.";
          break;
        default:
          errorMessage = "Une erreur non définie s'est produite.";
      }
    }

    if (errorMessage != null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text(
                  "Une erreur s'est produite",
                  style:
                      TextStyle(color: Color(0xff405d65), fontFamily: 'Cairo'),
                ),
                content: Text(
                  errorMessage,
                  style: TextStyle(fontFamily: 'Cairo'),
                ));
          });
    }
  }

  void _createAccountPressed() async {
    String errorMessage2;
    try {
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      _formChange();
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage2 = "Veuillez spécifier une adresse e-mail valide pour vous inscrire";
          break;
        case 'email-already-in-use':
          errorMessage2 = "$_email est déjà enregistré!";
          break;
        case 'weak-password':
          errorMessage2="Veuillez choisir un mot de passe plus fort";
          break;
        case "too-many-requests":
          errorMessage2 = "Trop de demandes. Réessayez plus tard.";
          break;
        default:
          errorMessage2 = "Une erreur non définie s'est produite.";
      }
    }
    if (errorMessage2 != null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text(
                  "Une erreur s'est produite",
                  style:
                      TextStyle(color: Color(0xff405d65), fontFamily: 'Cairo'),
                ),
                content: Text(
                  errorMessage2,
                  style: TextStyle(fontFamily: 'Cairo'),
                ));
          });
    }
  }

  void _passwordReset() async {
    String errorMessage3;
    String errorMessage31 = "Une erreur s'est produite";
    try {
      await auth.sendPasswordResetEmail(email: _email);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text(
                  'Terminé!',
                  style: TextStyle(color: Colors.red),
                ),
                content: Text(
                    'Un e-mail de réinitialisation a été envoyé à $_email')); //CHANGELATER
          });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "unknown":
          errorMessage3 =
              "Veuillez indiquer une adresse e-mail valide pour réinitialiser votre mot de passe.";
          errorMessage31 = "Email est requis!";
          break;
        case "user-not-found":
          errorMessage3 = "L'utilisateur avec cet e-mail n'existe pas.";
          break;
        case "invalid-email":
          errorMessage3 =
              "Veuillez indiquer une adresse e-mail valide pour réinitialiser votre mot de passe.";
          break;
        case "too-many-requests":
          errorMessage3 = "Trop de demandes. Réessayez plus tard.";
          break;
        default:
          errorMessage3 = "Une erreur non définie s'est produite.";
          errorMessage31 = 'Désolé';
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text(
                  errorMessage31,
                  style: TextStyle(color: Colors.red),
                ),
                content: Text(errorMessage3)); //CHANGELATER
          });
    }
  }
}
