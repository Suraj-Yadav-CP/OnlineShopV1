import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_shop/utility/app_strings.dart';
import 'package:online_shop/utility/db_constants/firebase_const.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {

  //text Controller
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //Login Method....
  Future<UserCredential?> loginMethod( context) async {
    UserCredential? userCredential;
    try {
      await auth.signInWithEmailAndPassword(email: emailController.text , password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // SignUp Method....
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // Storing Data....
  storeUserData({name,password,email}) async {
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set(
        {'name': name, 'password': password, 'email': email, 'imageUrl': ''});
  }

  // SignOut Method....
signOutMethod(context) async{
    try{
      await auth.signOut();
    }catch (e){
      VxToast.show(context, msg: e.toString());

    }
}
}
