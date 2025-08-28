
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../linker/linker.dart';

class AuthController extends GetxController {
  /// ------------------ Observables ------------------
  RxBool isloading = false.obs;

  /// ------------------ Text Controllers ------------------
  final TextEditingController name = TextEditingController();
  final TextEditingController number = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final TextEditingController email2 = TextEditingController();
  final TextEditingController password2 = TextEditingController();

  /// ------------------ Firebase & Local ------------------
  final FirebaseAuth _authController = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GetStorage _storage = GetStorage();

  /// ------------------ Signup User ------------------
  Future<void> signup() async {
    try {
      isloading.value = true;

      UserCredential userCredential =
      await _authController.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      String uid = userCredential.user!.uid;

      /// Save user data in Firestore
      await _firestore.collection("Users").doc(uid).set({
        "userId": uid,
        "name": name.text.trim(),
        "email": email.text.trim(),
        "number": number.text.trim(),
        "address": "",
      });

      /// Save to GetStorage
      _storage.write("email", email.text.trim());
      _storage.write("number", number.text.trim());
      _storage.write("uid", uid);

      /// Fetch user info after signup
      await fetchUserInfo();

      Get.snackbar("Great", "Account Created Successfully",
          backgroundColor: Colors.green,
          icon: Icon(Icons.done_outline, color: Colors.green.shade900));

      Get.offAll(() => BottomNav());
    } catch (e) {
      String message = e is FirebaseAuthException
          ? e.message ?? "Unknown error"
          : e.toString();
      Get.snackbar("Oops", message,
          backgroundColor: Colors.red,
          icon: Icon(Icons.error, color: Colors.red.shade900));
    } finally {
      isloading.value = false;
    }
  }

  /// ------------------ Signin User ------------------
  Future<void> signin() async {
    try {
      isloading.value = true;

      UserCredential userCredential =
      await _authController.signInWithEmailAndPassword(
        email: email2.text.trim(),
        password: password2.text.trim(),
      );

      String uid = userCredential.user!.uid;

      /// Fetch user data from Firestore
      DocumentSnapshot doc = await _firestore.collection("Users").doc(uid).get();

      if (doc.exists) {
        var userData = doc.data() as Map<String, dynamic>;

        /// Save to GetStorage
        _storage.write("email", userData["email"]);
        _storage.write("number", userData["number"]);
        _storage.write("uid", uid);
        _storage.write("name", userData["name"]);
        _storage.write("address", userData["address"]);
      }

      /// Fetch user info after signin
      await fetchUserInfo();

      Get.snackbar("Welcome", "Login Successful",
          backgroundColor: Colors.green,
          icon: Icon(Icons.done_outline, color: Colors.green.shade900));

      Get.offAll(() => BottomNav());
    } catch (e) {
      String message = e is FirebaseAuthException
          ? e.message ?? "Unknown error"
          : e.toString();
      Get.snackbar("Oops", message,
          backgroundColor: Colors.red,
          icon: Icon(Icons.error, color: Colors.red.shade900));
    } finally {
      isloading.value = false;
    }
  }

  /// ------------------ Update Profile ------------------
  Future<void> updateProfile({String? name, String? address}) async {
    try {
      String? uid = _storage.read("uid");
      if (uid == null) return;

      await _firestore.collection("Users").doc(uid).update({
        if (name != null) "name": name,
        if (address != null) "address": address,
      });

      /// Update GetStorage
      if (name != null) _storage.write("name", name);
      if (address != null) _storage.write("address", address);

      Get.snackbar("Updated", "Profile Updated Successfully",
          backgroundColor: Colors.green,
          icon: Icon(Icons.check, color: Colors.green.shade900));
    } catch (e) {
      String message = e is FirebaseAuthException
          ? e.message ?? "Unknown error"
          : e.toString();
      Get.snackbar("Oops", message,
          backgroundColor: Colors.red,
          icon: Icon(Icons.error, color: Colors.red.shade900));
    }
  }

  /// ------------------ Change Password ------------------
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      if (newPassword != confirmPassword) {
        Get.snackbar("Error", "Passwords do not match");
        return;
      }

      User? user = _authController.currentUser;
      if (user == null || user.email == null) return;

      /// Reauthenticate
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );
      await user.reauthenticateWithCredential(credential);

      /// Update password
      await user.updatePassword(newPassword);

      Get.snackbar("Success", "Password updated successfully",
          backgroundColor: Colors.green,
          icon: Icon(Icons.check, color: Colors.green.shade900));
    } catch (e) {
      String message = e is FirebaseAuthException
          ? e.message ?? "Unknown error"
          : e.toString();
      Get.snackbar("Oops", message,
          backgroundColor: Colors.red,
          icon: Icon(Icons.error, color: Colors.red.shade900));
    }
  }

  /// ------------------ User Info ------------------
  var username = ''.obs;
  var emailObs = ''.obs;
  var phone = ''.obs;
  var userInfoList = <Map<String, dynamic>>[].obs;

  Future<void> fetchUserInfo() async {
    String? uid = _storage.read("uid");
    if (uid == null) return;

    DocumentSnapshot doc = await _firestore.collection("Users").doc(uid).get();
    if (doc.exists) {
      var userData = doc.data() as Map<String, dynamic>;

      userInfoList.value = [userData];

      /// Update individual observables
      username.value = userData["name"] ?? '';
      emailObs.value = userData["email"] ?? '';
      phone.value = userData["number"] ?? '';

      userInfoList.refresh();
    }
  }

  /// ------------------ Dispose Controllers ------------------
  @override
  void onClose() {
    name.dispose();
    number.dispose();
    email.dispose();
    password.dispose();
    email2.dispose();
    password2.dispose();
    super.onClose();
  }
}

