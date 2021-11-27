import 'package:flutter/material.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/botao.dart';
import 'package:tcc_faculdadeimpacta/src/pages/cadastroPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _toggleVisibility = true;

  Widget _emailtxt() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Digite seu email",
        border: OutlineInputBorder(),
        hintStyle: TextStyle(
          color: Color(0xFF999999),
          fontSize: 14.0,
        ),
      ),
    );
  }

  Widget _senhatxt() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Digite sua senha",
        border: OutlineInputBorder(),
        hintStyle: TextStyle(
          color: Color(0xFF999999),
          fontSize: 14.0,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _toggleVisibility = !_toggleVisibility;
            });
          },
          icon: _toggleVisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _toggleVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image(
              image:AssetImage("assets/imagens/LOGOSITE.png"),
              height:200.0,
              width:250.0,
            ),
            Column(
              children: <Widget>[
                _emailtxt(),
                SizedBox(
                  height: 20.0,
                ),
                _senhatxt(),
              ],
            ),

            Container(alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(fontSize: 14),
                ),
                onPressed: () {},
                child: Text('Esqueceu sua senha?', style: TextStyle(color: Color(0xFFFF005C)),),
              ),
            ),


            SizedBox(
              height: 30.0,
            ),
            Button(btnText: "Entrar"),
            SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Não possui Cadastro?",
                  style: TextStyle(
                      color: Color(0xFF999999),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0),
                ),
                SizedBox(width: 5.0),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => cadastroPage()
                    ));
                  },
                  child: Text(
                    "Cadastre-se",
                    style: TextStyle(
                        color: Color(0xFFFF005C),
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}