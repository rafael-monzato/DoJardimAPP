import 'package:flutter/material.dart';
import 'package:tcc_faculdadeimpacta/src/pages/telaInicial.dart';
import 'package:tcc_faculdadeimpacta/src/pages/telaInicial.dart';
import 'package:tcc_faculdadeimpacta/src/pages/carrinhoPage.dart';
import 'package:tcc_faculdadeimpacta/src/pages/categoriasPage.dart';
import 'package:tcc_faculdadeimpacta/src/pages/categoriasPage.dart';
import 'package:tcc_faculdadeimpacta/src/pages/produtosPage.dart';
import 'package:tcc_faculdadeimpacta/src/pages/produtosPage.dart';


class Tabs extends StatefulWidget{
  Tabs(cpf, nome, id);


  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final List<Widget> pages = [
    TelaInicial(),
    produtosPage('',''),
    categoriasPage(),
    carrinhoPage(),
  ];
  @override
  int abaAtual = 0;
  void aoMudarDeAba(int index) {
    setState(() {
      abaAtual = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( //barralateral
      appBar: AppBar(
        backgroundColor: Color(0xFF242C33),
        title: Image.asset("assets/imagens/logo.png"),
      ),
      body: pages[abaAtual], //TRAZER O CONTEÚDO DA PÁGINA INICIAL HOME
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: abaAtual,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.gite_outlined ),
            title: Text('ínicio'),
           backgroundColor: Color(0xFFFF005C),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture_outlined),
            title: Text('Produtores'),
            backgroundColor: Color(0xFFFF005C),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_vintage_outlined),
            title: Text('Produtos'),
            backgroundColor: Color(0xFFFF005C),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text('Carrinho'),
            backgroundColor: Color(0xFFFF005C),
          ),
        ],
        onTap: (index) {
          setState(() {
            abaAtual = index;
          });
        },
        fixedColor: Color(0xFFFF005C),
      ),
    );
  }
}