import 'package:flutter/material.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/botao.dart';
import 'package:tcc_faculdadeimpacta/src/pages/LoginPage.dart';

class cadastroPage extends StatefulWidget {
  @override
  _cadastroPageState createState() => _cadastroPageState();
}

class _cadastroPageState extends State<cadastroPage> {
  bool _toggleVisibility = true;

  late String _email;
  late String _nome;
  late String _senha;
  late String _telefone;
  late String _cpf;
  // String _confirmPassword;

  GlobalKey<FormState> _formKey = GlobalKey();

  Widget _emailtxt() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Email",
        hintStyle: TextStyle(
          color: Color(0xFF999999),
          fontSize: 14.0,
        ),
      ),
      onSaved: (email) {
        _email = email!;
      },
      validator: (email) {
        String errorMessage;
        if (!email!.contains("@")) {
          errorMessage = "Seu email está incorreto";
        }
        if (email.isEmpty) {
          errorMessage = "O campo email é obrigatório";
        }

        //return errorMessage;
      },
    );
  }

  Widget _nometxt() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Nome completo",
        hintStyle: TextStyle(
          color: Color(0xFF999999),
          fontSize: 14.0,
        ),
      ),
      onSaved: (username) {
        _nome = username!.trim();
      },
      validator: (username) {
        String errorMessage;
        if (username!.isEmpty) {
          errorMessage = "O nome completo é obrigatório";
        }
        // if(username.length > 8 ){
        //   errorMessage = "Your username is too short";
        // }
        //return errorMessage;
      },
    );
  }

  Widget _telefoneInt() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Número de celular com DDD",
        hintStyle: TextStyle(
          color: Color(0xFF999999),
          fontSize: 14.0,
        ),
      ),
      onSaved: (telefone) {
        _telefone = telefone!;
      },
      validator: (telefone) {
        String errorMessage;
        if (telefone!.isEmpty) {
          errorMessage = "O número do celular é obrigatório";
        }
        // if(username.length > 8 ){
        //   errorMessage = "Your username is too short";
        // }
        //return errorMessage;
      },
    );
  }

  Widget _cpfInt() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "CPF somente números",
        hintStyle: TextStyle(
          color: Color(0xFF999999),
          fontSize: 14.0,
        ),
      ),
      onSaved: (cpf) {
        _cpf = cpf!;
      },
      validator: (cpf) {
        String errorMessage;
        if (cpf!.isEmpty) {
          errorMessage = "O CPF é obrigatório";
        }
        if(cpf.length < 12 ){
          errorMessage = "CPF incorreto";
        }
        //return errorMessage;
      },
    );
  }
  Widget _senhatxt() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Senha",
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
      onSaved: (senha) {
        _senha = senha!;
      },
      validator: (senha) {
        String errorMessage;

        if (senha!.isEmpty) {
          errorMessage = "O campo senha é requerido";
        }
        //return errorMessage;
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image:AssetImage("assets/imagens/LOGOSITE.png"),
                  height:100.0,
                  width:250.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: <Widget>[
                    _nometxt(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _emailtxt(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _telefoneInt(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _cpfInt(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _senhatxt(),
                  ],
                ),

                // Card(
                //   elevation: 5.0,
                //   child: Padding(
                //     padding: EdgeInsets.all(20.0),
                //     child:
                //   ),
                // ),
                SizedBox(
                  height: 20.0,
                ),

                Button(btnText: "Cadastrar"),

                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Já possui Cadastro?",
                      style: TextStyle(
                          color: Color(0xFF999999),
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0),
                    ),
                    SizedBox(width: 5.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage()));
                      },
                      child: Text(
                        "Fazer Login",
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
        ),
      ),
    );
  }



  void onSubmit(Function authenticate) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print("Seu Email: $_email, sua senha: $_senha");
      authenticate(_email, _senha);
    }
  }
}