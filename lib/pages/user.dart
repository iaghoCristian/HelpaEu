import 'dart:io';

import 'package:HelpaEu/auth/auth.dart';
import 'package:HelpaEu/models/prestador.dart';
import 'package:HelpaEu/pages/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class User extends StatefulWidget {
  User({Key key}) : super(key: key);

  @override
  _User createState() => _User();
}

class _User extends State<User> {
  List<Prestador> conta;

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
        title: Text("Sua conta"),
      ),
      body: 

      
    );
  }
}
