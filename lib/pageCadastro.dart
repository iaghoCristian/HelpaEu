import 'package:flutter/material.dart';

bool botaoCliente = true;
bool botaoPrestador = false;

class PageCadastro extends StatefulWidget {
  @override
  _PageCadastroState createState() => _PageCadastroState();
}

class _PageCadastroState extends State<PageCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff324755),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
            child: Form(
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
                    decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffD97D54)))),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffD97D54)))),
                  ),
                  Visibility(
                    visible: botaoPrestador,
                    child: TextFormField(
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
                    onPressed: () {},
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
}
