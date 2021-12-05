import 'package:flutter/material.dart';


class categoriasPage extends StatefulWidget{

  @override
  _categoriasPageState createState() => _categoriasPageState();
}

class _categoriasPageState extends State<categoriasPage> {

  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView(
        padding:EdgeInsets.only(left:20.0, top:30.0, right:20.0),
        children: <Widget>[

          Column(
            children: <Widget>[
              CardPageCategorias(480.0, 340.0)
            ],
          ),
          SizedBox(height: 10.0,),
        ],
      ),

    );
  }


}