import 'package:flutter/material.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/buscar.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/cardCategorias.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/categorias.dart';
import '../models/categoriasModel.dart';

class categoriasPage extends StatefulWidget{

  @override
  _categoriasPageState createState() => _categoriasPageState();

}

class _categoriasPageState extends State<categoriasPage>{
  @override
  Widget build(BuildContext  context){
    return Scaffold(
      body: ListView(
        padding:EdgeInsets.only(left:16.0,top:20.0,right:16.00),
          children:<Widget>[
            Buscar(),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Categorias",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CardCategorias(totalProd: 10, imgCat: "assets/imagens/Girassolflores.png" ,nomeCat: "Produtos",),
      GestureDetector(
        onTap: () {
          print("Pressionou' pressed");
        },
      )],
      ),
    ],
    ),
    );
  }


}