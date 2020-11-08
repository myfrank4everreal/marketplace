import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';




class CurrentUser extends ChangeNotifier{
  String _uid;
  String _email;

  String get getuid => _uid;

  String get getemail => _email;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email, String password)async{
    bool retval =  false;

    try {
      UserCredential _userCredential = 
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      

        if (_userCredential.user !=null){
          retval = true;

        }
        
        // if (e.code == 'weak-password') {
        //   print('The password provided is too weak.');
        // } else if (e.code == 'email-already-in-use') {
        //   print('The account already exists for that email.');
        // }
      }catch (e) {
        print(e);
    }


    return retval;

  }


 //  for login
  Future<bool> loginUser(String email, String password) async{
     bool retval =  false;

     try {
        UserCredential _userCredential =
         await _auth.signInWithEmailAndPassword(
          email: email, password: password);

         if (_userCredential.user != null){
           _uid = _userCredential.user.uid;
           _email = _userCredential.user.email;

           retval = true;
         }

       
      } on FirebaseAuthException catch  (e) {
        print(e);
      }

   


    return retval;

  }


  


  // we need an instance of firebase auth




}