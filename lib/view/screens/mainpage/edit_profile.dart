import 'package:flutter/material.dart';
import 'package:wowsell/view/screens/mainpage/navigation_bar_App_bar_Drawer.dart';


class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
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
            "Developer Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              // Text(
              //   "Edit Profile",
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              // ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:AssetImage('assets/images/pritom.JPG'

                              ))),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Pritom Chowdhury", "", false),
              buildTextField("chowdhurypritom@gmail.com", "", false),
              // buildTextField("Password", "", true),
              buildTextField("Chattogram", "", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // OutlineButton(
                  //   padding: EdgeInsets.symmetric(horizontal: 50),
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(20)),
                  //   onPressed: () {},
                  //   child: Text("CANCEL",
                  //       style: TextStyle(
                  //           fontSize: 14,
                  //           letterSpacing: 2.2,
                  //           color: Colors.black)),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: Center(
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavController()));
                        },
                        color: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
