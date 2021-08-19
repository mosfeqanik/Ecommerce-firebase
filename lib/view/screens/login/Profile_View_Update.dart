import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:provider/provider.dart';
import 'package:wowsell/model/E_commerce_Provider_Data.dart';
import 'package:wowsell/view/common_widgets/buttonStyle.dart';


class ViewProfilePage extends StatefulWidget {
  @override
  _ViewProfilePageState createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
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
          'Buyer',
          style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Consumer<EcommerceProvider>(builder: (_, provider, ___) {
        return Container(
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
                                      image: AssetImage('assets/images/as.png'),
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
                                  //Edit
                                  provider.isEditButtonClicked
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GetIcon(
                                              iconPic: Icons.edit,
                                              iconBgColor: Colors.green,
                                              iconColor: Colors.white,
                                              onTapOnIcon: () {
                                                provider.isEditButtonClicked =
                                                    false;
                                              },
                                            ),
                                            SizedBox(width: 10),
                                            GetIcon(
                                              iconPic: Icons.delete,
                                              iconBgColor: Colors.red,
                                              iconColor: Colors.black,
                                              onTapOnIcon: () {},
                                            )
                                          ],
                                        )
                                      : Container()
                                ],
                              )),

                          LabelForProfile(labelForProfile: '🧑‍ Name'),
                          InputFieldForProfile(
                            isEnable: provider.isEditButtonClicked,
                            hintTextForInputField: "Enter Your Name",
                          ),
                          //Email Address
                          LabelForProfile(labelForProfile: '✉️ Email Address'),
                          InputFieldForProfile(
                            isEnable: provider.isEditButtonClicked,
                            hintTextForInputField: "Enter Email Address",
                          ),
                          //Mobile Number
                          LabelForProfile(labelForProfile: '📱 Mobile Number'),
                          InputFieldForProfile(
                            isEnable: provider.isEditButtonClicked,
                            hintTextForInputField: "Enter Mobile Number",
                          ),
                          LabelForProfile(
                              labelForProfile: '🗼 Contract Address'),
                          InputFieldForProfile(
                            isEnable: provider.isEditButtonClicked,
                            hintTextForInputField: "Enter Contract Address",
                          ),
                          !provider.isEditButtonClicked
                              ? GetActionButtonOn()
                              : Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class GetIcon extends StatelessWidget {
  final Color iconColor;
  final Color iconBgColor;

  final IconData iconPic;
  final Function onTapOnIcon;

  GetIcon({this.iconColor, this.iconBgColor, this.iconPic, this.onTapOnIcon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: iconBgColor,
      child: IconButton(
        icon: Icon(
          iconPic,
          color: iconColor,
        ),
        onPressed: onTapOnIcon,
      ),
    );
  }
}

class GetActionButtonOn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EcommerceProvider>(
      builder: (_, provider, ___) {
        return Column(
          children: [
            LabelForProfile(labelForProfile: '🔑 Changer Your password'),
            InputFieldForProfile(
              isEnable: provider.isEditButtonClicked,
              hintTextForInputField: "Enter New password",
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: ButtonDesign(
                        qButtonColor: Colors.green,
                        qButtonTittle: 'Save',
                        qButtonTextColor: Colors.white,
                        qButtonFunction: () {
                          provider.isEditButtonClicked = true;
                        },
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: ButtonDesign(
                        qButtonColor: Colors.red,
                        qButtonTittle: 'Cancel',
                        qButtonTextColor: Colors.white,
                        qButtonFunction: () {
                          provider.isEditButtonClicked = true;
                        },
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class InputFieldForProfile extends StatelessWidget {
  final String hintTextForInputField;
  final bool isEnable;

  InputFieldForProfile({this.hintTextForInputField, this.isEnable});

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
