import 'package:flutter/material.dart';
import 'package:wowsell/components/cart_products.dart';
class Cart extends StatefulWidget{
  @override
  _CartState createState()=> _CartState();
}
class _CartState extends State<Cart>{
  @override Widget build (BuildContext context){
    return Scaffold(


      body: new Cart_Products(),
      bottomNavigationBar: new Container(
        color:Colors.white70,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: new Text("\$100"),
              ),),
            Expanded(child: new MaterialButton(onPressed: (){},
            child: new Text("Check out", style: TextStyle(color: Colors.white),),
              color: Colors.red,),
            )
          ],
        ),
      ),

    ) ;
  }
}