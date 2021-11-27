//Onde vai ter os cards da tela inicial

import 'package:flutter/material.dart';
import 'package:tcc_faculdadeimpacta/src/dados/categoriasDados.dart';
import 'package:tcc_faculdadeimpacta/src/models/categoriasModel.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/cardCategorias.dart';

class AreaCategoria extends StatelessWidget{
  final List<CategoriasModel> _categorias = categorias;

  @override
  Widget build(BuildContext context){
    return Container(
      height:100.0, //definiçãodasmedidasdocard
      margin: EdgeInsets.only(top:10.0, bottom: 16.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,//direcionamentodocard
        itemCount: _categorias.length, //pegarnobancodedadosotamanhodacategoria // SO A CATEGORIA
        itemBuilder: (BuildContext context, int index){ //CADA CARD DO APP
          return CardCategorias(
            nomeCat: _categorias[index].nomeCat,
            totalProd: _categorias[index].totalProd,
            imgCat: _categorias[index].imgCat,

          );
        },


      ),
    );
  }
}