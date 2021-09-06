import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:wowsell/model/E_commerce_Provider_Data.dart';
import 'package:wowsell/model/Product_List.dart';
import 'package:wowsell/view/common_widgets/animations/fade_animation.dart';
import 'package:wowsell/view/screens/mainpage/thankYou.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  String customerName;
  String customerPhone;
  String customerAddress;
  List<ProductList> products;
  String totalPrice;
  String order = "Cash On Delivery";

  setDataToUserInfo(data) {
    var providerProductPage =
        Provider.of<EcommerceProvider>(context, listen: false);
    products = providerProductPage.productlists;
    totalPrice = providerProductPage.total.toString();
    customerName = data['name'];
    customerPhone = data['phone'];
    customerAddress = data['address'];
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          FadeAnimation(
              1.6,
              Text(
                "🧑Your Name :-",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          FadeAnimation(
              1.6,
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  customerName,
                  style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          FadeAnimation(
              1.6,
              Text(
                " 📱Your Phone Number :-",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          FadeAnimation(
              1.6,
              Padding(
                padding: const EdgeInsets.only(left:40.0),
                child: Text(
                  customerPhone,
                  style: TextStyle(

                    color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          FadeAnimation(
              1.6,
              Text(
                "🗼Your Address :-",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          FadeAnimation(
              1.6,
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  customerAddress,
                  style: TextStyle(

                      color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          FadeAnimation(
              1.6,
              Text(
                "Products",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 20,
          ),
          FadeAnimation(
            1.8,
            Consumer<EcommerceProvider>(builder: (_, provider, ___) {
              return Container(
                  height: 200,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: provider.productlists.length,
                    itemBuilder: (context, index) {
                      return noteListItem(provider.productlists[index]);
                    },
                  ));
            }),
          ),
          SizedBox(
            height: 120,
          )
        ],
      ),
    );
  }

  Future sendOrderDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("users-order-data");
    return _collectionRef
        .doc(currentUser.email)
        .collection("items")
        .doc()
        .set({
      "customerName":customerName,
      "customerPhone":customerPhone,
      "customerAddress":customerAddress,
      "totalPrice":totalPrice,
      "order":order,
    }).then((value) =>Navigator.push(context, MaterialPageRoute(builder: (_)=>ThankYouScreen()))).catchError((error)=>print("something is wrong. $error"));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/wowsell_image.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3)
                          ])),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(
                                1,
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Consumer<EcommerceProvider>(
                                builder: (_, provider, ___) {
                              return Row(
                                children: <Widget>[
                                  FadeAnimation(
                                      1.2,
                                      Text(
                                        "${provider.total.toString()} \$",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )),
                                ],
                              );
                            }),

                            Row(
                              children: <Widget>[
                                FadeAnimation(
                                    1.2,
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        order,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users-form-data")
                        .doc(FirebaseAuth.instance.currentUser.email)
                        .snapshots(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      var data = snapshot.data;
                      if (data == null) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return setDataToUserInfo(data);
                    },
                  ),
                ]),
              )
            ],
          ),
          Positioned.fill(
            bottom: 50,
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FadeAnimation(
                  2,
                  InkWell(
                    onTap:() {sendOrderDataToDB();},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black87),
                      child: Align(
                          child: Text(
                        "CheckOut",
                        style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding noteListItem(ProductList products) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white10,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      products.productName,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      products.productPrice,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
