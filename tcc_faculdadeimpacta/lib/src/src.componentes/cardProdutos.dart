//Produtos destacados da home page

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tcc_faculdadeimpacta/src/abas/tabs1.dart';

class CardProduto extends StatefulWidget {
  var _altura, _largura, _nomebusca, _idcat;

  CardProduto(altura, largura, nomebusca, idcat) {
    this._altura = altura;
    this._largura = largura;
    this._nomebusca = nomebusca;
    this._idcat = idcat;
  }
  @override
  _CardProdutoState createState() => _CardProdutoState();

}

class _CardProdutoState extends State<CardProduto> {
  var cardText = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  var carregando = false;
  var dados;
  var nome, imagem, valor;
  var buscar;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listarDados();

  }

  _listarDados() async{
    buscar = widget._nomebusca;
      var storage = FlutterSecureStorage();

    var response = await http.get(
        Uri.parse("https://app-flower-impacta.herokuapp.com/api/produtos"),
        headers: {"Accept": "application/json","Authorization":"Bearer "+storage.read(key: "token").toString()});
    final map = json.decode(response.body);
    final itens = map["data"];
    if(map["data"] == []){
      mensagem();
    }else{
      setState(() {
        carregando = true;
        this.dados = itens;

      });

    }

  }


  mensagem(){
    var alert = new AlertDialog(
      title: new Text('Listar Dados'),
      content: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            new Text("Produto não encontrado"),
          ],
        ),
      ),
      actions: <Widget>[
        new TextButton(
          child: new Text('Ok'),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Tabs("","","")));
          },
        ),
      ],
    );
    showDialog(context: context, child: alert);



  }


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: widget._altura,
            width: widget._altura,
            child: !carregando
          ? new LinearProgressIndicator()
            : new ListView.builder(
         itemCount: this.dados != null ? this.dados.length : 0,
          itemBuilder: (context, i){
          final item = this.dados[i];


          return new Container(
              margin: EdgeInsets.only(bottom: 7.0),
              child:Stack(
                children: <Widget>[
                  Container(
                    child:Image.network(item['imagem']),

                  ),
                      Positioned(
                        left: 10.0,
                        bottom: 0.0,
                        width: 339.0,
                        height: 48.0,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Colors.black54, Colors.black12])),
                        ),
                      ),
                      Positioned(
                        left: 10.0,
                        bottom: 10.0,
                        right: 10.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item['nome'],
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),

                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  item['valor'],
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orangeAccent),
                                ),
                                Text("(Dúzia)",
                                    style: TextStyle(color: Color(0xFFFFFFFF)))
                              ],
                            ),
                          ],
                        ),
                      ),

                ],
              ),


          );

          }

    ),



    )
    ],
    ),
    );
  }

}


