import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/pritom.jpg'),
              ),
              Text('Pritom Chowdhury',style: TextStyle(
                  fontFamily: 'pacifico',fontSize: 40, color: Colors.white
              ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal.shade100,
                    letterSpacing: 2.5
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.grey.shade50,
                  thickness: 2,
                ),
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                  child:
                  ListTile(
                    leading: Icon(Icons.phone,
                      color:Colors.teal,
                    ),
                    title: Text('+01674465743',style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal.shade900,
                    ),
                    ),
                  )

              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                  child:
                  ListTile(
                    leading: Icon(Icons.email,
                      color:Colors.teal,
                    ),
                    title: Text('chowdhurypritom@gmail.com',style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal.shade900,
                    ),
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}

