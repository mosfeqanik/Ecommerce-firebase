import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:wowsell/model/E_commerce_Provider_Data.dart';
import 'package:wowsell/view/screens/mainpage/navigation_bar_App_bar_Drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfoAddPage extends StatefulWidget {

  @override
  _ProfileInfoAddPageState createState() => _ProfileInfoAddPageState();
}

class _ProfileInfoAddPageState extends State<ProfileInfoAddPage> {
  TextEditingController _nameEditController = TextEditingController();
  TextEditingController _phoneNumberEditController = TextEditingController();
  TextEditingController _addressEditController = TextEditingController();

  sendUserDataToDB()async{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(currentUser.email).set({
      "name":_nameEditController.text,
      "phone":_phoneNumberEditController.text,
      "address":_addressEditController.text,
    }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>BottomNavController()))).catchError((error)=>print("something is wrong. $error"));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          title: Text(
            'User',
            style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.black,
                fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                      //profile Pic
                      child: Column(
                        children: [
                          Stack(fit: StackFit.loose, children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 140.0,
                                  height: 140.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/Profilepic.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding:
                                EdgeInsets.only(top: 90.0, right: 100.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 25.0,
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )),
                          ])
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Personal Information',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          LabelForProfile(labelForProfile: '🧑‍ Name'),
                          Padding(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child: TextField(
                                    controller: _nameEditController,
                                    decoration: InputDecoration(hintText: "Enter Your Name"),
                                    enabled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //Mobile Number
                          LabelForProfile(labelForProfile: '📱 Mobile Number'),
                          Padding(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child: TextField(
                                    controller: _phoneNumberEditController,
                                    decoration: InputDecoration(hintText: "Enter Mobile Number"),
                                    enabled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          LabelForProfile(
                              labelForProfile: '🗼 Contract Address'),
                          Padding(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child: TextField(
                                    controller: _addressEditController,
                                    decoration: InputDecoration(hintText: "Enter Contract Address"),
                                    enabled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child:MaterialButton(
                                color: Colors.green,
                                elevation: 0,
                                height: 50.h,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () { sendUserDataToDB(); },
                                child: Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.w600, fontSize: 18),
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
    );
  }
}

class InputFieldForProfile extends StatelessWidget {
  final String hintTextForInputField;
  final bool isEnable;
  final TextEditingController qTextEditController;
  final String qkeyboardType;

  InputFieldForProfile({this.hintTextForInputField, this.isEnable,this.qTextEditController,this.qkeyboardType});

  @override
  Widget build(BuildContext context) {
    return Consumer<EcommerceProvider>(
      builder: (_, provider, ___) {
        return Padding(
          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: qTextEditController,
                  decoration: InputDecoration(hintText: hintTextForInputField),
                  enabled: !provider.isEditButtonClicked,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class LabelForProfile extends StatelessWidget {
  final String labelForProfile;

  LabelForProfile({this.labelForProfile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                labelForProfile,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
