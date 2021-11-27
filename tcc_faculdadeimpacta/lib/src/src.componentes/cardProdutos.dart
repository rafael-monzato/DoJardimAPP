//Produtos destacados da home page

import 'package:flutter/material.dart';

class CardProdutos extends StatefulWidget {

  final String id;
  final String nome;
  final String imagem;
  final String categoria;
  final double valor;
  final double desconto;
  final double avaliacoes;

  CardProdutos({
    required this.id,
    required this.nome,
    required this.imagem,
    required this.categoria,
    required this.valor,
    required this.desconto,
    required this.avaliacoes});

  @override
  _CardProdutosState createState() => _CardProdutosState();
}

class _CardProdutosState extends State<CardProdutos> {
  var cardText = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: 230.0,
            margin: EdgeInsets.only(left: 0.0, right:0.0),
            child: Image(
              image: AssetImage(
                  widget.imagem
              ),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            height: 60.0,
            width: 800.0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black87, Colors.black12])),
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
                      widget.nome,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      widget.valor.toString(),
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF)),
                    ),
                    Text("(Unidade)",
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

}

