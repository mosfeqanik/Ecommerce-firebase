import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wowsell/const/appcolor.dart';
import 'package:wowsell/database/database_helper.dart';
import 'package:wowsell/model/E_commerce_Provider_Data.dart';
import 'package:wowsell/model/Product_List.dart';
import 'package:wowsell/view/common_widgets/utils/custom_toast.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  DatabaseHelper _db = DatabaseHelper();
  bool isLoading = true;
  var providerProductPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providerProductPage =
        Provider.of<EcommerceProvider>(context, listen: false);
  }





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
        child: Consumer<EcommerceProvider>(builder: (_, productProvider, ___) {
          return SingleChildScrollView(
              child: productProvider.isLoading
                  ? productProvider.productlists.contains(null) ||
                  productProvider.productlists.length <= 0
                  ? Container(
                child: Center(
                  child: Text(
                    "You have not added anything in cart",
                    style: TextStyle(fontSize: 20.h),
                  ),
                ),
              )
                  : ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 5,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: productProvider.productlists.length,
                itemBuilder: (context, index) {
                  return productListItem(
                      productProvider.productlists[index]);
                },
              )
                  : Center(
                child: CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<Color>(AppColors.qblack),
                ),
              ));
        }),
      ),
    );
  }

  Padding productListItem(ProductList products) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
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
                        image: NetworkImage(products.productImg),
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
                    products.productName,
                    style: TextStyle(color: Colors.black, fontSize: 26.h),
                    maxLines: 2,
                  ),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: "\$ ${products.productPrice.toString()}",
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
                  onPressed: () {
                    // onDelete(products.id);
                  },
                  icon: Icon(Icons.remove))
            ],
          ),
        ),
      ),
    );
  }
}
