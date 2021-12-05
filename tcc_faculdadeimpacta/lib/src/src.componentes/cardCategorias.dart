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
     margin: EdgeInsets.only(right: 16),
     //child: Card(
       child: Padding(
         padding: EdgeInsets.only(left: 8.0),
         child:Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Image(
                   image:AssetImage(imgCat),
                   height: 67.0,
                   width: 67.0,
                 ),
                 SizedBox(height: 8.0,),
                 Text(nomeCat, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0)), //criarfontcomstiloarrumarcod
               ],
             )
         ),
       );
     //);
    //);
  }
}