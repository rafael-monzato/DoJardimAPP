import 'package:flutter/material.dart';


class CardCarrinho extends StatefulWidget{
  _CardCarrinhoState createState() =>  _CardCarrinhoState();
}

class _CardCarrinhoState extends State<CardCarrinho> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {

    return Card(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 70.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/imagens/Bonsaiflores.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(35.0),
                    /* boxShadow: [
                            BoxShadow(
                                //color: Colors.purple,
                                blurRadius: 5.0,
                                offset: Offset(0.0, 2.0))
                          ]*/
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),


                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Bonsai",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "R\u{0024} 10,00",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      height: 25.0,
                      width: 180.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Flores",
                                  style: TextStyle(
                                      color: Color(0xFFD3D3D3),
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 5.0,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "x",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD3D3D3), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  width:90.0,
                  height: 40.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(child: InkWell(
                            onTap: () {
                              setState(() {
                                _count -= 1;
                              });
                            },
                            child: Icon(Icons.remove_circle_outline,
                                color: Color(0xFFD3D3D3))),
                        ),
                        Expanded(child: Text(
                          _count.toString(), textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0, color: Colors.grey),
                        ),
                        ),
                        Expanded(child: InkWell(
                            onTap: () {
                              setState(() {
                                _count += 1;
                              });
                            },
                            child: Icon(Icons.add_circle_outline,
                                color: Color(0xFFD3D3D3))),
                        )
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   width: 10.0,
                // ),
                // Spacer(),
                // GestureDetector(
                //   onTap: () {},
                //   child: Icon(
                //     Icons.cancel,
                //     color: Colors.grey,
                //   ),
                // ),
              ],
            )
        )
    );
  }

}