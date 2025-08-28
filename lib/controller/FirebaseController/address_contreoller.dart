import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddressController extends GetxController {
  Future<void> saveAddress({
    required String streetaddress,
    required String zipcode,
    required String city,
    required String state,
    required String country,
    required String lattitude,
    required String longitude,
    bool status = true,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;
    await FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('address')
      .add({
        'streetaddress': streetaddress,
        'zipcode': zipcode,
        'city': city,
        'state': state,
        'country': country,
        'lattitude': lattitude,
        'longitude': longitude,
        'status': status,
      });
  }
}
