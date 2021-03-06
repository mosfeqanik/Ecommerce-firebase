import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wowsell/const/appcolor.dart';
import 'package:wowsell/view/screens/mainpage/navigation_bar_App_bar_Drawer.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var inputText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavController()));}
        ),
        title: Center(
          child: Text(
            "Search here",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50.h,
                        child: TextFormField(
                          onChanged: (val) {
                            setState(() {
                              inputText = val;
                              print(inputText);
                            });
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              hintText: "Search Products here",
                              hintStyle: TextStyle(fontSize: 15.sp)),
                        ),
                      ),
                    ),
                    Container(
                      height: 50.h,
                      width: 50.h,
                      color: AppColors.qblack,
                      child: InkWell(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("products")
                          .where("product_name",
                              isGreaterThanOrEqualTo: inputText)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Something went wrong"),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        }
                        return ListView(
                          children: snapshot.data.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return Card(
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              elevation: 5,
                              child: ListTile(
                                  title: Text(data['product_name']),
                                  leading: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                        "${data['product_img'][0]}"),
                                    backgroundColor: Colors.transparent,
                                  )),
                            );
                          }).toList(),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
