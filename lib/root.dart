import 'package:ctse_sms_app/authentication.dart';
import 'package:ctse_sms_app/home.dart';
import 'package:ctse_sms_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     final  user =  Provider.of<User>(context);
     print(user);
     if(user == null){
       return Authentication();
     }else{
       return Home();
     }

  }
}

