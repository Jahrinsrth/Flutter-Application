import 'package:ctse_sms_app/register.dart';
import 'package:ctse_sms_app/signin.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showSignInUser = true;
  void view(){
    setState(() => showSignInUser = !showSignInUser);
  }
  @override
  Widget build(BuildContext context) {
       if(showSignInUser){
         return SignIn(view:view);
       }else{
         return  Register(view:view);
       }
  }
}


 