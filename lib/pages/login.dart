import 'package:HelpaEu/auth/auth.dart';
import 'package:HelpaEu/pages/home.dart';
import 'package:HelpaEu/resources/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final senha = TextEditingController();

  _onAlertError(context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "Conta não encontrada",
      desc: "Revise as informações",
      buttons: [
        DialogButton(
          color: grayColor,
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    void authLogin() async {
      await Auth().signIn(email.text.trim(), senha.text);
      FirebaseUser user = await Auth().getCurrentUser();
      if (user != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(title: "HelpaEu"),
            ));
      } else {
        _onAlertError(context);
      }
    }

    return Scaffold(
      backgroundColor: grayColor,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 28),
                    )),
                Container(
                  width: 330,
                  height: 45,
                  margin: EdgeInsets.only(top: 300),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Entre com seu email"),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  width: 330,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: Center(
                    child: TextField(
                      controller: senha,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Entre com sua senha"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 150,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.white,
                    onPressed: () {
                      authLogin();
                    },
                    child: Text("ENTRAR",
                        style: TextStyle(
                            color: grayColor, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
