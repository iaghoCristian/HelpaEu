import 'dart:io';

import 'package:HelpaEu/models/prestador.dart';
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("HelpaEu"),
        actions: [
          IconButton(
            tooltip: "Sair do App",
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              exit(0);
            },
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        padding: EdgeInsets.all(20),
        children: prestadores
            .map(
              (prestador) => Container(
                height: 100,
                width: 110,
                color: Colors.grey[300],
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(top: 8, left: 8, bottom: 8),
                    child: Text(prestador.nome),
                  ),
                  Container(
                    child: Text(prestador.profissao),
                  ),
                ]),
              ),
            )
            .toList(),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
