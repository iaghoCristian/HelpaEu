import 'dart:io';

import 'package:HelpaEu/auth/auth.dart';
import 'package:HelpaEu/models/prestador.dart';
import 'package:HelpaEu/pages/servicosDetail.dart';
import 'package:HelpaEu/pages/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Prestador> prestadores = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    Firestore.instance
        .collection("prestador")
        .getDocuments()
        .then((prestadorSnapshot) {
      List<Prestador> secondList = [];
      List<DocumentSnapshot> documentSnapshots = prestadorSnapshot.documents;
      documentSnapshots.forEach((documentPrestadorSnapshot) {
        Map<String, dynamic> document = documentPrestadorSnapshot.data;
        Prestador prestador = Prestador(
          id: documentPrestadorSnapshot.documentID,
          nome: document["nome"],
          celular: document["celular"],
          cidade: document["cidade"],
          descricao: document["descricao"],
          estado: document["estado"],
          profissao: document["profissao"],
        );
        secondList.add(prestador);
      });
      setState(() {
        prestadores = secondList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HelpaEu"),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            tooltip: "Conta",
            onPressed: () {
              Auth().signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Welcome(),
                  ));
            },
          ),
          IconButton(
            tooltip: "Sair do App",
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              exit(0);
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(20),
        children: prestadores
            .map(
              (prestador) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServicosDetalhes(
                              prestador: prestador,
                            )),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xff853DE8), Colors.white])),
                  child: Column(children: [
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        prestador.profissao,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8, left: 8, bottom: 8),
                      child: Text(
                        prestador.nome,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/iconServicos.png'),
                            fit: BoxFit.contain),
                      ),
                    )
                  ]),
                ),
              ),
            )
            .toList(),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
