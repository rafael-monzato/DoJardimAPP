import 'package:flutter/material.dart';

class Buscar extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 5.0,
      child: TextField(
          style: TextStyle(color: Colors.grey, fontSize: 18.0),
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
              suffixIcon: Material(
                  elevation: 2.0,
                  child: Icon(
                    Icons.search,
                    color: Color(0xFFFF005C),
                  )
              ),
              border:InputBorder.none,
              hintText: "Buscar Produtos"
          )

      ),
    );
  }

}