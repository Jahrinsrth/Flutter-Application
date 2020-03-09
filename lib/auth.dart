import 'package:ctse_sms_app/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

 class AuthService{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    User _userFirebaseUser(FirebaseUser user){
      return user != null ? User(uid:user.uid) : null;
    }

    // auth change user stream code
    Stream<User>  get user{
      return _auth.onAuthStateChanged
          // .map((FirebaseUser user) => _userFirebaseUser(user));
            .map(_userFirebaseUser);
    }

    Future signInAnonymous()  async{
      try{
        AuthResult res = await _auth.signInAnonymously();
        FirebaseUser _user = res.user;
        return _userFirebaseUser(_user);
      }
      catch(e){
        print(e.toString());
         return null;
      }
    }

    Future register(String mail,String password) async {
      try{
        AuthResult res = await _auth.createUserWithEmailAndPassword(email: mail, password: password);
        FirebaseUser  user = res.user;
        return _userFirebaseUser(user);
      }catch(e){
          print(e.toString());
          return null;
      }
    }
    Future signIn(String mail,String password) async {
      try{
        AuthResult res = await _auth.signInWithEmailAndPassword(email: mail, password: password);
        FirebaseUser  user = res.user;
        return _userFirebaseUser(user);
      }catch(e){
        print(e.toString());
        return null;
      }
    }



    Future logOut()  async{
      try{
        return  await _auth.signOut();
      }
      catch(e){
        print(e.toString());
        return null;
      }
    }
 }