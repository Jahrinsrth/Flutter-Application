import 'package:ctse_sms_app/auth.dart';
import 'package:ctse_sms_app/root.dart';
import 'package:ctse_sms_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value : AuthService().user,
        child: MaterialApp(
          home:Root(),

        )
    );

  }
}

