import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tcc_faculdadeimpacta/src/pages/produtosPage.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/cardProdutos.dart';


class Buscar extends StatelessWidget {
  var dados;

  var txtbuscar = new TextEditingController();
  @override
  Widget build(BuildContext context){
    return Material(
      //elevation: 5.0,
      child: TextFormField(
          controller: txtbuscar,
          style:TextStyle(color: Colors.grey, fontSize: 16.0),
          cursorColor: Theme.of(context).primaryColor,
          decoration:InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
              suffixIcon: Material(
                //elevation: 2.0,

                  child: IconButton(
                      icon:Icon(
                        Icons.search,
                        color: Color(0xFFFF005C),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => produtosPage(txtbuscar.text, "")
                        ));
                      })

              ),
              //border:InputBorder.none,
              hintText: "Buscar Flores"
          )
      ),
    );
  }

}
