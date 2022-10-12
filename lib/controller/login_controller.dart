import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginController extends GetxController{

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<String> logInUser({
    required String email,
    required String password,
  }) async{
    String res = 'An error occurred';

    try{
      if(email.isNotEmpty || password.isNotEmpty){
        // register users
        await _auth.signInWithEmailAndPassword(email: email, password: password);

        // add user to our database

        res = 'success';
      }else{
        res = 'Enter all fields';
      }
    }catch(err){
      res = err.toString();
    }
    return res;
  }


}