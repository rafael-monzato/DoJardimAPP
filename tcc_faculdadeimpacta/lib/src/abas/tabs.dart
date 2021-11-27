import 'package:flutter/material.dart';
import 'package:tcc_faculdadeimpacta/src/pages/telaInicial.dart';
import 'package:tcc_faculdadeimpacta/src/pages/telaInicial.dart';
import 'package:tcc_faculdadeimpacta/src/pages/carrinhoPage.dart';
import 'package:tcc_faculdadeimpacta/src/pages/categoriasPage.dart';
import 'package:tcc_faculdadeimpacta/src/pages/categoriasPage.dart';
import 'package:tcc_faculdadeimpacta/src/pages/produtosPage.dart';
import 'package:tcc_faculdadeimpacta/src/pages/produtosPage.dart';


class Tabs extends StatefulWidget{
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs>{
  int abaAtual = 0;
  late TelaInicial telaInicial;
  late carrinhoPage carrinho;
  late produtosPage produtos;
  late categoriasPage categorias;

  List<Widget> pages = [];
  late Widget pagAtual;



  @override
  void initState() {
    telaInicial = TelaInicial();
    carrinho = carrinhoPage();
    produtos = produtosPage();
    categorias = categoriasPage();

    pages = [telaInicial, carrinho, produtos, categorias];
    pagAtual = telaInicial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea( //barralateral
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF242C33),
            elevation: 0,
            iconTheme: IconThemeData(color: Color(0xFFFF005C)),
            title: Text(
              abaAtual == 0 ? "assets/imagens/logo.png"
                  : abaAtual == 1
                  ? "Carrinho"
                  : abaAtual == 2 ? "Produtos" : "Categorias",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
              ),


            ),
            centerTitle: true,

            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.notifications_none,

                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                  onPressed: () {}),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,

                ),
                onPressed: () {},
              ),
            ],
          ),

          //COLOCAR DRAWER

          resizeToAvoidBottomInset: false,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: abaAtual,
            onTap: (index) {
              setState(() {
                abaAtual = index;
                pagAtual = pages[index];
              });
            },
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                title: Text("Carrinho"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.photo_library,
                ),
                title: Text("Produtos"),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                title: Text("Categoria"),
              ),
            ],
          ),


          //TRAZER O CONTEÚDO DA PÁGINA INICIAL HOME
          body:pagAtual,


        )
    );
  }


}