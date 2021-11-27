import 'package:flutter/material.dart';
import 'package:tcc_faculdadeimpacta/src/models/categoriasModel.dart';

class CardCategorias extends StatelessWidget{
  final String nomeCat;
  final String imgCat;
  final int totalProd;

  CardCategorias({required this.nomeCat, required this.imgCat, required this.totalProd,});

  @override
  Widget build(BuildContext context){
    return Container(
     margin: EdgeInsets.only(right: 20),
     child: Card(
       child: Padding(
         padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
         child: Row(
           children:<Widget>[
             Image(
               image:AssetImage(imgCat),
               height: 65.0, //alturadocard
               width: 65.0,
             ),
             SizedBox(width: 20.0,),
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(nomeCat, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)), //criarfontcomstiloarrumarcod
                 Text("$totalProd Produtos", style: TextStyle( fontSize: 14.0)),
               ],
             )
           ],
         ),
       ),
     ),
    );
  }
}