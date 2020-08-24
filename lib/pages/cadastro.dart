import 'package:HelpaEu/auth/auth.dart';
import 'package:HelpaEu/pages/home.dart';
import 'package:HelpaEu/resources/color.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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
  final servico = TextEditingController();

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
                  Visibility(
                    visible: botaoPrestador,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: servico,
                      validator: (value) {
                        if (value.isEmpty) return "O campo é obrigatório";
                        if (value.length < 6)
                          return "A senha precisa ter no mínimo 6 caracteres";
                      },
                      decoration: InputDecoration(
                          labelText: 'Serviço',
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: borderOrange))),
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
      await Auth().signUp(email.text.trim(), senha.text);

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
