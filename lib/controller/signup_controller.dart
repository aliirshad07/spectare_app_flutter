import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spectare_app_flutter/controller/ads_controller.dart';

class SignupController extends GetxController{

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  AdsController _controller = Get.put(AdsController());



  Future<String> signupUser({
    required String username,
    required String email,
    required String password
})async{
    String res = "An error occurred";
    try{
      if(username.isNotEmpty || email.isNotEmpty || password.isNotEmpty){
        
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.uid);
        _firestore.collection('users').doc(cred.user!.uid).set({
          "username": username,
          "email": email,
          "credits": _controller.credit,
        });
        res = 'success';
      }
    }catch(e){
      res = e.toString();
    }
    return res;
  }






}