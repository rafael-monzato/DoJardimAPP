import 'package:flutter/material.dart';

class Buscar extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2.0,
      child: TextField(
          style: TextStyle(color: Colors.grey, fontSize: 15.0),
          cursorColor: Theme.of(context).primaryColorLight,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              suffixIcon: IconButton(
                  color: Color(0xFFFF005C),
                  disabledColor: Colors.green[100],
                  onPressed: () {  },
                  icon: Icon(Icons.search),
                  ),
              border:OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              hintText: "Buscar Produtos"
          )

      ),
    );
  }

}