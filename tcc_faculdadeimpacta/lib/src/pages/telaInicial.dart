
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc_faculdadeimpacta/src/models/ProdotutosModel.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/cardProdutos.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/buscar.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/cabecalho.dart';
import 'package:tcc_faculdadeimpacta/src/src.componentes/categorias.dart';



class TelaInicial extends StatefulWidget{ //'#criarclasseparamudarnoapp'
  @override
  _TelaInicialState createState() => _TelaInicialState();

}

 class _TelaInicialState extends State<TelaInicial>{

  List<ProdutosModel> _produtos = produtos;
  @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: ListView(
       padding:EdgeInsets.only(left:16.0,top:20.0,right:16.00),
         children:<Widget>[
           //Cabecalho(),
           AreaCategoria(),
           Buscar(),
           SizedBox(
             height: 20.0,
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Text(
                 "Produtos mais vendidos",
                 style: TextStyle(
                   fontSize: 16.0,
                   fontWeight: FontWeight.normal,
                 ),
               ),
               GestureDetector(
                 onTap: () {
                   print("Pressionou' pressed");
                 },
                 child: Text(
                   "Ver Todos",
                   style: TextStyle(
                     color: Color(0xFFFF005C),
                     fontWeight: FontWeight.bold,
                     fontSize: 12.0,
                   ),
                 )
               )
             ],
             ),
            SizedBox(height: 20.0),
            Column(
              children: _produtos.map(_produtosItens).toList(),
            )
            ])

           //ondechamaparaaparecernatelaincial
   );
   }
   Widget _produtosItens(ProdutosModel produtos){
   return Container(
     margin: EdgeInsets.only(
       bottom: 20.0
     ),
     child: CardProdutos(
       id: produtos.id,
       nome: produtos.nome,
       imagem: produtos.imagem,
       categoria: produtos.categoria,
       valor: produtos.valor,
       desconto: produtos.desconto,
       avaliacoes: produtos.avaliacoes,

     )
   );
   }
}

