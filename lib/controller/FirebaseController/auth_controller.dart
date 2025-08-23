import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../linker/linker.dart';

class AuthController extends GetxController {
  RxBool isloading = false.obs;

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  TextEditingController email2 = TextEditingController();
  TextEditingController password2 = TextEditingController();

  final FirebaseAuth _authController = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GetStorage _storage = GetStorage();

  /// --------- Signup User--------------
  Future<void> signup() async {
    try {
      isloading.value = true;

      UserCredential userCredential = await _authController.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      String uid = userCredential.user!.uid;

      /// ----------  FireStore me user ka data save ---------
      await _firestore.collection("Users").doc(uid).set({
        "userId": uid,
        "name": name.text,
        "email": email.text,
        "number": number.text,
        "address": "",
      });

      /// ----------- GetStorage me number/email save ---------------
      _storage.write("email", email.text);
      _storage.write("number", number.text);
      _storage.write("uid", uid);

      Get.snackbar("Great", "Account Created Successfully",
          backgroundColor: Colors.green,
          icon: Icon(Icons.done_outline, color: Colors.green.shade900));
      Get.offAll(() => HomeScreen());
    } catch (e) {
      Get.snackbar("Oops", e.toString(),
          backgroundColor: Colors.red,
          icon: Icon(Icons.error, color: Colors.red.shade900));
    } finally {
      isloading.value = false;
    }
  }

  /// ----------Signin User----------------
  Future<void> signin() async {
    try {
      isloading.value = true;

      UserCredential userCredential = await _authController.signInWithEmailAndPassword(
        email: email2.text,
        password: password2.text,
      );

      String uid = userCredential.user!.uid;

      /// ------------- Firestore sy user ka data fetch ---------------
      DocumentSnapshot doc =
      await _firestore.collection("Users").doc(uid).get();

      if (doc.exists) {
        var userData = doc.data() as Map<String, dynamic>;
        ///  -----------GetStorage main store -----------------
        _storage.write("email", userData["email"]);
        _storage.write("number", userData["number"]);
        _storage.write("uid", uid);
        _storage.write("name", userData["name"]);
        _storage.write("address", userData["address"]);
      }

      Get.snackbar("Welcome", "Login Successful",
          backgroundColor: Colors.green,
          icon: Icon(Icons.done_outline, color: Colors.green.shade900));
      Get.offAll(() => HomeScreen());
    } catch (e) {
      Get.snackbar("Oops", e.toString(),
          backgroundColor: Colors.red,
          icon: Icon(Icons.error, color: Colors.red.shade900));
    } finally {
      isloading.value = false;
    }
  }

  /// ---------Update Profile Data (edit profile screen se) -----------------
  Future<void> updateProfile({String? name, String? address}) async {
    try {
      String uid = _storage.read("uid");
      if (uid == null) return;

      await _firestore.collection("Users").doc(uid).update({
        if (name != null) "name": name,
        if (address != null) "address": address,
      });

      /// ------------- Update GetStorage ------------------
      if (name != null) _storage.write("name", name);
      if (address != null) _storage.write("address", address);

      Get.snackbar("Updated", "Profile Updated Successfully",
          backgroundColor: Colors.green,
          icon: Icon(Icons.check, color: Colors.green.shade900));
    } catch (e) {
      Get.snackbar("Oops", e.toString(),
          backgroundColor: Colors.red,
          icon: Icon(Icons.error, color: Colors.red.shade900));
    }
  }
}
