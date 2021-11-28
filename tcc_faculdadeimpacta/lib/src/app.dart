import 'package:flutter/material.dart';
import 'package:tcc_faculdadeimpacta/src/abas/tabs1.dart';
import 'pages/telaInicial.dart';

 class App extends StatelessWidget{
   @override
   Widget build(BuildContext context){
     //'#colocarodesignnoapp'
     return MaterialApp(
       title: "DoJardim",
       theme: ThemeData(primaryColor: Colors.blueGrey), //'#mudaracor',
       home: Tabs(),

     );
   }
 }
