import 'dart:io';

import 'package:HelpaEu/auth/auth.dart';
import 'package:HelpaEu/models/prestador.dart';
import 'package:HelpaEu/pages/welcome.dart';
import 'package:flutter/material.dart';

class ServicosDetalhes extends StatefulWidget {
  Prestador prestador;
  ServicosDetalhes({this.prestador});

  @override
  _ServicosDetalhesState createState() => _ServicosDetalhesState();
}

class _ServicosDetalhesState extends State<ServicosDetalhes> {
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
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Serviço',
              style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Hero(
              tag: 'assets/images/iconServicos.png',
              child: Image.asset(
                'assets/images/iconServicos.png',
                height: 150,
                width: 100,
                fit: BoxFit.contain,
              )),
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              color: Colors.grey,
              height: 2.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nome:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.prestador.nome)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Profissão:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.prestador.profissao)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cidade:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.prestador.cidade)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Estado:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.prestador.estado)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Celular:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.prestador.celular)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Descrição:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.prestador.descricao)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
