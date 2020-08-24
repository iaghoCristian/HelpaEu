import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

bool botaoCliente = true;
bool botaoPrestador = false;

String nome;
String email;
String senha;
String servico;

final _formKey = GlobalKey<FormState>();

class PageCadastro extends StatefulWidget {
  @override
  _PageCadastroState createState() => _PageCadastroState();
}

class _PageCadastroState extends State<PageCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff324755),
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
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                    },
                    onSaved: (newValue) => nome = newValue,
                    decoration: InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffD97D54)))),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    onSaved: (newValue) => email = newValue,
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                      if (!EmailValidator.validate(value))
                        return "Email inválido";
                    },
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffD97D54)))),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    onSaved: (newValue) => senha = newValue,
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
                            borderSide: BorderSide(color: Color(0xffD97D54)))),
                  ),
                  Visibility(
                    visible: botaoPrestador,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      onSaved: (newValue) => servico = newValue,
                      validator: (value) {
                        if (value.isEmpty) return "O campo é obrigatório";
                        if (value.length < 6)
                          return "A senha precisa ter no mínimo 6 caracteres";
                      },
                      decoration: InputDecoration(
                          labelText: 'Serviço',
                          labelStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xffD97D54)))),
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
                    color: botaoCliente ? Colors.white : Color(0xff324755),
                    textColor: botaoCliente ? Color(0xff324755) : Colors.white,
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
                    color: botaoPrestador ? Colors.white : Color(0xff324755),
                    textColor:
                        botaoPrestador ? Color(0xff324755) : Colors.white,
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
                    textColor: Color(0xff324755),
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

  void signUp() {
    if (_formKey.currentState.validate()) {}
  }
}
