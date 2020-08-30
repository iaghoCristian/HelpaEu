import 'package:HelpaEu/auth/auth.dart';
import 'package:HelpaEu/pages/home.dart';
import 'package:HelpaEu/resources/color.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool botaoCliente = true;
bool botaoPrestador = false;

final _formKey = GlobalKey<FormState>();

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final nome = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  final celular = TextEditingController();
  final cidade = TextEditingController();
  final estado = TextEditingController();
  final descricao = TextEditingController();
  var servico;
  List<String> servicos = <String>[
    "Pedreiro",
    "Bombeiro",
    "Encanador",
    "Engenheiro"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: grayColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'SIGN UP',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: <Widget>[
                  TextFormField(
                    controller: nome,
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                    },
                    decoration: InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffD97D54)))),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: email,
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                      if (!EmailValidator.validate(value))
                        return "Email inválido";
                    },
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: borderOrange))),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: senha,
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                      if (value.length < 6)
                        return "A senha precisa ter no mínimo 6 caracteres";
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: borderOrange))),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: celular,
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                    },
                    decoration: InputDecoration(
                        labelText: 'Celular',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: borderOrange))),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: cidade,
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                    },
                    decoration: InputDecoration(
                        labelText: 'Cidade',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: borderOrange))),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: estado,
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                    },
                    decoration: InputDecoration(
                        labelText: 'Estado',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: borderOrange))),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: descricao,
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                    },
                    decoration: InputDecoration(
                        labelText: 'Descrição',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: borderOrange))),
                  ),
                  Visibility(
                    visible: botaoPrestador,
                    child: DropdownButton(
                      isExpanded: true,
                      items: servicos
                          .map((value) => DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                value: value,
                              ))
                          .toList(),
                      onChanged: (servicoSelecionado) {
                        setState(() {
                          servico = servicoSelecionado;
                        });
                      },
                      value: servico,
                      hint: Text("Profissão",
                          style: TextStyle(color: Colors.grey)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    padding: EdgeInsets.only(right: 40, left: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            color: botaoCliente
                                ? Color(0x00000000)
                                : Colors.white)),
                    onPressed: () {
                      setState(() {
                        botaoCliente = !botaoCliente;
                        botaoPrestador = !botaoPrestador;
                      });
                    },
                    color: botaoCliente ? Colors.white : grayColor,
                    textColor: botaoCliente ? grayColor : Colors.white,
                    child: Text("Cliente".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(right: 40, left: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            color: botaoPrestador
                                ? Color(0x00000000)
                                : Colors.white)),
                    onPressed: () {
                      setState(() {
                        botaoCliente = !botaoCliente;
                        botaoPrestador = !botaoPrestador;
                      });
                    },
                    color: botaoPrestador ? Colors.white : grayColor,
                    textColor: botaoPrestador ? grayColor : Colors.white,
                    child: Text("Prestador".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    padding: EdgeInsets.only(right: 40, left: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {
                      signUp();
                    },
                    color: Colors.white,
                    textColor: grayColor,
                    child: Text("Próximo".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      String idUser = await Auth().signUp(email.text.trim(), senha.text);
      if (botaoPrestador == true) {
        await Firestore.instance
            .collection('prestador')
            .document(idUser)
            .setData({
          'nome': nome.text.toString(),
          'celular': celular.text.toString(),
          'descricao': descricao.text.toString(),
          'cidade': cidade.text.toString(),
          'estado': estado.text.toString(),
          'profissao': servico
        });
      } else if (botaoCliente == true) {
        await Firestore.instance
            .collection('cliente')
            .document(idUser)
            .setData({
          'nome': nome.text.toString(),
          'celular': celular.text.toString(),
          'cidade': cidade.text.toString(),
          'estado': estado.text.toString()
        });
      }

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(
              title: "HelpaEu",
            ),
          ));
    }
  }
}
