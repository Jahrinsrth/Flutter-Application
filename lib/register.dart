import 'package:ctse_sms_app/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
 class Register extends StatefulWidget {

   final Function view;
   Register({this.view});
   @override
   _RegisterState createState() => _RegisterState();
 }
 
 class _RegisterState extends State<Register> {
   final AuthService  _auth  = AuthService();
   final _fkey = GlobalKey<FormState>();
   String mail = '';
   String password = '';

   @override
   Widget build(BuildContext context) {
     return    Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.red[600],
           title: Text("send SMS"),
           actions: <Widget>[
             FlatButton.icon(
                 onPressed: () async {
                   //  await _auth.logOut();
                   widget.view();
                 },
                 icon: Icon(Icons.person),
                 label: Text("sign in"))
           ],
         ),
         body:Container(
             padding: EdgeInsets.all(20),
             child: Form(
               key: _fkey,
               child: Column(
                 children: <Widget>[
                   SizedBox(height: 20.0),
                   TextFormField(
                     validator: (val) => val.isEmpty ? 'enter an email':null,
                     onChanged: (val){
                       setState(() => mail = val);
                     } ,
                   ),
                   SizedBox(height: 20.0),
                   TextFormField(
                     validator: (val) => val.length < 6 ? 'enter 6 charct password':null,
                     obscureText: true,
                     onChanged: (val){
                       setState(() => password = val);
                     },
                   ),
                   SizedBox(height: 20.0),
                   RaisedButton(
                       color: Colors.pink,
                       onPressed: () async{
                      if(_fkey.currentState.validate()){
                        dynamic res = await _auth.register(mail, password);
                        if(res ==  null){
                         // setState(() => errorTextConfiguration );
                          print('errrr');
                        }
                      }
                       },
                       child:Text(
                         "Register",
                         style: TextStyle(color:Colors.white),
                       )
                   )
                 ],
               ),
             )
         )
     );
   }
 }
 