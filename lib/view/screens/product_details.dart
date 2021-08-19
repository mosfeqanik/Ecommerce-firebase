import 'package:flutter/material.dart';
import 'package:wowsell/components/cart.dart';
class ProductDetails extends StatefulWidget{
  
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;
  

ProductDetails(
{
  this.product_detail_name,
 this.product_detail_new_price,
  this.product_detail_old_price,
  this.product_detail_picture
});
@override
  _ProductDetailState createState()=> _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetails>
{
  @override
  Widget build(BuildContext context) {
 return Scaffold(
   appBar: AppBar(
     title: Text(
       "WoWSell",
       style: TextStyle(
         color: Colors.black,
         fontSize: 20,
         fontWeight: FontWeight.w600,
       ),
     ),
     centerTitle: true,
     backgroundColor: Colors.white,
     elevation: 4.0,
     actions: [
       IconButton(
         icon: Icon(
           Icons.search,
           size: 25,
           color: Colors.black,
         ),
         onPressed: () {},
       ),
       IconButton(
         icon: Icon(
           Icons.shopping_cart,
           size: 25,
           color: Colors.black,
         ),
         onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));
         },
       ),
     ],
     iconTheme: IconThemeData(color: Colors.black),


   ),
   body: new ListView(
     children:
       <Widget>[
         new Container(
           height: 300.0,
           child: GridTile(
             child: Container(
               color: Colors.white70,
               child: Image.asset(widget.product_detail_picture),
             ),
             footer: new Container(
               color: Colors.white70,
               child: ListTile(
                 leading: new Text(widget.product_detail_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                 title: new Row(
                   children: <Widget>[
                     Expanded(
                         child: new Text("\$${widget.product_detail_old_price}",
                           style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),)
                     ),
                     Expanded(
                         child: new Text("\$${widget.product_detail_new_price}",
                           style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),
                     )),
                   ]
                 ),
               ),
             ),),
         ),
         Row(
           children: <Widget>[
             Expanded(
                 child: MaterialButton(
                   onPressed: (){},
                   color: Colors.white,
                   textColor: Colors.grey,
                   elevation: 0.2,
                   child: Row(
                     children: <Widget>[
                       Expanded(
                           child: new Text("size")),
                       Expanded(
                           child: new Icon(Icons.arrow_drop_down)),
                     ],
                   ),
                 )),

             Expanded(
                 child: MaterialButton(
                   onPressed: (){},
                   color: Colors.white,
                   textColor: Colors.grey,
                   elevation: 0.2,
                   child: Row(
                     children: <Widget>[
                       Expanded(
                           child: new Text("Color")),
                       Expanded(
                           child: new Icon(Icons.arrow_drop_down)),
                     ],
                   ),
                 )),
             Expanded(
                 child: MaterialButton(
                   onPressed: (){},
                   color: Colors.white,
                   textColor: Colors.grey,
                   elevation: 0.2,
                   child: Row(
                     children: <Widget>[
                       Expanded(
                           child: new Text("Qty")),
                       Expanded(
                           child: new Icon(Icons.arrow_drop_down)),
                     ],
                   ),

                 ))

           ],
         ),
         Row(
           children: <Widget>[
             Expanded(
                 child: MaterialButton(
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));
                   },
                   color: Colors.redAccent,
                   textColor: Colors.white,
                   elevation: 0.2,
                   child: new Text(" Buy Now"),
                 )),
             new IconButton(
                 icon: Icon(Icons.add_shopping_cart),color: Colors.red, onPressed:(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));
             }
                 ),
             new IconButton(
                 icon: Icon(Icons.favorite_border),color: Colors.red, onPressed:(){}
             ),
           ],
         ),
         Divider(),
         new ListTile(
           title: new Text("product Desciption"),
           subtitle: new Text("Blue & beige tartan checks checked opaque casual shirt ,has a slim collar, button placket, 1 patch pocket, long regular sleeves, curved hem.Blue & beige tartan checks checked opaque casual shirt ,has a slim collar, button placket, 1 patch pocket, long regular sleeves, curved hem"),
         )

     ],
   ),

   );

  }


}