import 'package:ctse_sms_app/auth.dart';
import 'package:ctse_sms_app/loadingwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 class SignIn extends StatefulWidget {

   final Function view;
   SignIn({this.view});
   @override
   _SignInState createState() => _SignInState();
 }
 
 class _SignInState extends State<SignIn> {
     final AuthService _auth  = AuthService();
     final _fkey = GlobalKey<FormState>();
     bool loadSpinKit =  false;
     String error = '';

     String mail = '';
     String password = '';

   @override
   Widget build(BuildContext context) {
     return loadSpinKit ? OnLoad() : Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.red[600],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
              //  await _auth.logOut();
                widget.view();
              },
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
      ),
       body:Container(
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage("assets/background.png"),
               fit: BoxFit.cover,
             ),
           ),
         padding: EdgeInsets.fromLTRB(30,20,30,20),
         //margin: EdgeInsets.fromLTRB(0, 100, 0, 20),
         child: Form(
           key: _fkey,
           child: Column(
             children: <Widget>[
               SizedBox(height: 20.0),
               TextFormField(
                 decoration: InputDecoration(
                     labelText: 'username',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                   border: new OutlineInputBorder(
                     borderRadius: const BorderRadius.all(
                       const Radius.circular(30.0),
                     ),
                   ),
                 ),

                 validator: (val) => val.isEmpty ? 'enter an email':null,
                 onChanged: (val){
                   setState(() => mail = val);
                 },
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
               SizedBox(height: 20.0),
               TextFormField(
                 decoration: InputDecoration(
                   labelText: 'password',
                   labelStyle: TextStyle(
                     color: Colors.white,
                   ),
                   enabledBorder:OutlineInputBorder(
                     borderSide: BorderSide(
                       color: Colors.white,
                       width: 2.0,
                     ),
                     borderRadius: const BorderRadius.all(
                       const Radius.circular(30.0),
                     ),
                   ),
                 ),
                 validator: (val) => val.length < 6 ? 'enter 6 charct password':null,
                 obscureText: true,
                 onChanged: (val){
                   setState(() => password = val);
                 },
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
               SizedBox(height: 20.0),
               RaisedButton(
                   padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 150.0),
                   shape: RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(30.0),
                       side: BorderSide(color: Colors.red)
                   ),
                 color: Colors.pink,
                 onPressed: () async{
                   if(_fkey.currentState.validate()){
                     print("valid");
                     setState(() => loadSpinKit = true);
                     dynamic res = await _auth.signIn(mail, password);
                     if(res ==  null){
                       // setState(() => errorTextConfiguration );
                       setState(() {
                         error = "could not find credentilas";
                         loadSpinKit = false;
                       });
                       print('errrr');
                     }
                   }
                 },
                 child:Text(
                   "sign in",
                   style: TextStyle(
                       color:Colors.white,
                     fontSize: 15,
                   ),

                 )
               )

             ],
           ),
         )
       )
     );
   }
 }
