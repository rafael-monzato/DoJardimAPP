import 'dart:convert';
import 'package:tcc_faculdadeimpacta/src/pages/TelaInicial.dart';
import 'package:tcc_faculdadeimpacta/src/pages/produtosPage.dart';
import 'package:tcc_faculdadeimpacta/src/abas/tabs1.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CardPageCategorias extends StatefulWidget {
  var _altura, _largura;

  CardPageCategorias(altura, largura) {
    this._altura = altura;
    this._largura = largura;

  }
  @override
  _CardPageCategoriasState createState() => _CardPageCategoriasState();

}

class _CardPageCategoriasState extends State<CardPageCategorias> {
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


    final url =
        "";
    final response = await http.get(url);
    final map = json.decode(response.body);
    final itens = map["result"];
    if(map["result"] == 'Dados não encontrados!'){
      mensagem();
    }else{
      setState(() {
        carregando = true;
        this.dados = itens;
        print(dados);
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
        new FlatButton(
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
            width: widget._largura,
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
                          child:Image.network("http://delivery.hugocursos.com.br/images/categorias/" + item['imagem']),

                        ),

                        Positioned(
                          left: 0.0,
                          bottom: 0.0,
                          width: 340.0,
                          height: 60.0,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [Colors.black, Colors.black12])),
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
                                  GestureDetector(
                                    onTap:(){
                                      print(item['nome']);
                                    },
                                    child:Text(
                                      item['nome'],
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  )

                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => produtosPage("", item['id'])
                                      ));

                                    },
                                    child:Text(
                                      item['produtos'] + " Produtos",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orangeAccent),
                                    ),
                                  )
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
