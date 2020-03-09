 import 'package:ctse_sms_app/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: Text("SMS"),
        backgroundColor: Colors.grey[700],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.logOut();
              },
              icon: Icon(Icons.person),
              label: Text("logout"))
        ],
      ),
      body:Container(
        child: RaisedButton(

           onPressed: (){

           },
          child: Text(
            "sms"
          ),
        ),
      ),
    );
  }
}



