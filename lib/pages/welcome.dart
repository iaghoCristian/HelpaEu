import 'package:HelpaEu/pages/cadastro.dart';
import 'package:HelpaEu/pages/login.dart';
import 'package:HelpaEu/resources/color.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _Welcome createState() => _Welcome();
}

class _Welcome extends State<Welcome> {
  final email = TextEditingController();
  final senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      "HelpaEu",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 100),
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Bem vindo a nossa rede",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 250,
                        color: borderOrange,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Encontre já o serviço que você precisa na palma da sua mão",
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Container(
                    margin: EdgeInsets.only(top: 150),
                    child: Column(
                      children: [
                        Divider(
                          color: borderOrange,
                        ),
                        Container(
                          width: 150,
                          margin: EdgeInsets.only(top: 30),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ));
                            },
                            child: Text("Entrar".toUpperCase(),
                                style: TextStyle(
                                    color: grayColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          width: 150,
                          margin: EdgeInsets.only(top: 30),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Cadastro(),
                                  ));
                            },
                            child: Text("Registrar".toUpperCase(),
                                style: TextStyle(
                                    color: grayColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
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
