import 'package:flutter/material.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/cardProdutos.dart';
import 'package:tcc_faculdadeimpacta/src/pages/loginPage.dart';

import 'loginPage.dart';

class produtosPage extends StatefulWidget{
  var _nome, _idcat;

  produtosPage(nome, idcat) {

    this._nome = nome;
    this._idcat = idcat;
  }
  @override
  _produtosPageState createState() => _produtosPageState();
}

class _produtosPageState extends State<produtosPage> {
  var nomebusca, idcat;

  Widget build(BuildContext context) {
    nomebusca = widget._nome;
    idcat = widget._idcat;
    return Scaffold(

      appBar: appBar(),

      body: ListView(
        padding: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        children: <Widget>[

          Column(
            children: <Widget>[
              CardProduto(480.0, 340.0, nomebusca, widget._idcat)
            ],
          ),
          SizedBox(height: 10.0,),
        ],
      ),

    );
  }


  appBar() {
    if (nomebusca != "" || widget._idcat != "") {
      return AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Lista de Flores",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold
          ),

        ),
        centerTitle: true,

        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.account_box,
                // size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()));
              }),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],

      );
    }
  }
}