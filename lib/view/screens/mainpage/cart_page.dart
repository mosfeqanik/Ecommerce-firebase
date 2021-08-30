import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          children: [
            Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80.h,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin:
              EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 88,
                      child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/wowsell-b6337.appspot.com/o/products%2Fbag%2F25.png?alt=media&token=0ed0fff4-d5e4-4614-a25d-128bbe2f0888"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Product name",
                          style: TextStyle(
                              color: Colors.black, fontSize: 26.h),
                          maxLines: 2,
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            text: "\$ Price",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                                color: Colors.red),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove))
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
