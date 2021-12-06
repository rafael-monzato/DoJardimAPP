import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/botao.dart';
import 'package:tcc_faculdadeimpacta/src/pages/loginPage.dart';
import 'package:tcc_faculdadeimpacta/src/abas/tabs1.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class cadastroPage extends StatefulWidget {
  var _id;

  cadastroPage(id) {

    this._id = id;
  }
  @override
  _cadastroPageState createState() => _cadastroPageState();
}

class _cadastroPageState extends State<cadastroPage> {
  bool _toggleVisibility = true;

  late String _email;
  late String _nome;
  late String _senha;
  late String _cpf;
  late String _telefone;

  var nome, cpf, telefone, usuario, senha;
  var nometxt, emailtxt, senhatxt, cpftxt, telefonetxt;
  var dados;
  var caminhoImg = "assets/imagens/cadastro.png";
  var nomebtn = "Inserir";


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

  Widget _telefonetxt() {
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

  Widget _cpftxt() {
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

  mensagem(res){
    var alert = new AlertDialog(
      title: new Text('Inserir Dados'),
      content: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            new Text(res),
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(context: context, child: alert);

    if(res == 'Inserido com Sucesso'){
      nometxt.text = "";
      telefonetxt.text = "";
      emailtxt.text = "";
      senhatxt.text = "";
      cpftxt.text = "";
    }

  }


  //VERIFICAR SE O USUÁRIO ESTÁ LOGADO, SE TIVER RECUPERAR SEUS DADOS PARA EDITAR
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget._id != ""){
      caminhoImg = "assets/imagens/excluir.png";
      nomebtn = "Editar";
      recuperarDados();
    }
    nometxt = new TextEditingController();
    emailtxt = new TextEditingController();
    senhatxt = new TextEditingController();
    cpftxt = new TextEditingController();
    telefonetxt = new TextEditingController();
  }

  //método para recuperar os dados do usuário logado
  recuperarDados() async{

      var storage = FlutterSecureStorage();


    setState(() {

      nome =   storage.read(key: "");
      cpf = storage.read(key: "cpf");
      telefone = storage.read(key: "telefone");
      usuario = storage.read(key: "name");
      senha = storage.read(key: "name");


      nometxt = new TextEditingController(text: nome);
      emailtxt = new TextEditingController(text: usuario);
      senhatxt = new TextEditingController(text: senha);
      cpftxt = new TextEditingController(text: cpf);
      telefonetxt = new TextEditingController(text: telefone);
    });



  }

  //método para inserir na api
  void _inserir() async{
    var url = "";
    var response = await http.post(Uri.parse("https://app-flower-impacta.herokuapp.com/api/cadastrar"), body:{
      "name" : nometxt.text,
      "email" : emailtxt.text,
      "cpf" : cpftxt.text,
      "telefone" : telefonetxt.text,
      "password" : senhatxt.text,
      "password_confirmation" : senhatxt.text,
      "nivel":"Cliente"
    });

    final map = json.decode(response.body);
    final res = map["message"];
    print(res);
    mensagem(res);
  }

  mensagemExcluir(){
    var alert = new AlertDialog(
      title: new Text('Excluir Usuário'),
      content: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            new Text("Deseja Realmente Excluir o Usuário"),
          ],
        ),
      ),
      actions: <Widget>[
        new TextButton (
          child: new Text('Sim'),
          onPressed: () {
            excluirUsuario(widget._id);
          },
        ),
        new TextButton(
          child: new Text('Não'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(context: context, child: alert);
  }

  excluirUsuario(id){
          var storage = FlutterSecureStorage();

    http.post(
        Uri.parse(
            "https://app-flower-impacta.herokuapp.com/api/logout"),
        headers: {"Accept": "application/json","Authorization":"Bearer "+storage.});
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Tabs("", "", "")
    ));
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
                    _telefonetxt(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _cpftxt(),
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