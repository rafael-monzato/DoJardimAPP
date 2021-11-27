import 'package:flutter/material.dart';

class Buscar extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2.0,
      child: TextField(
          style: TextStyle(color: Colors.grey, fontSize: 15.0),
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              suffixIcon: Material(
                  child: Icon(
                    Icons.search,
                    color: Color(0xFFFF005C),
                    size: 24.0,
                  )
              ),
              hintText: "Buscar Produtos"
          )

      ),
    );
  }

}