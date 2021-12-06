//Onde vai ter os cards da tela incicial

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tcc_faculdadeimpacta/src/pages/produtosPage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/cardCategorias.dart';


class AreaCategoria extends StatefulWidget {



  @override
  _AreaCategoriaState createState() => _AreaCategoriaState();
}

class _AreaCategoriaState extends State<AreaCategoria> {

  var carregando = false;
  var dados;

  listarDados() async{
      var storage = FlutterSecureStorage();
     final response = await http.get(Uri.parse("https://app-flower-impacta.herokuapp.com/api/categorias"),
           headers: {"Accept": "application/json","Authorization":"Bearer "+storage.read(key: "token").toString()});

    final map = json.decode(response.body);
    final itens = map["data"];


    setState(() {
      carregando = true;
      this.dados = itens;

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.listarDados();
    print('teste');
  }




  @override
  Widget build(BuildContext context){


    return Container(

        height:80.0,
        margin:EdgeInsets.only(top:10.0),
        child: !carregando
            ? new LinearProgressIndicator()
            : new ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: this.dados != null ? this.dados.length : 0,
          itemBuilder: (context, i){
            final item = this.dados[i];
            print(item);
            return GestureDetector(
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => produtosPage("", item['id'])
                ));

              },
              child: cardCategorias(
                nomeCat: item['nome'],
                totalProd: item['produtos'],
                imgCat: item['imagem'],
              ),
            );
          },
        )
    );
  }
}