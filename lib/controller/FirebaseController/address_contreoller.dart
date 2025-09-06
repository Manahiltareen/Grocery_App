import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class AddressController extends GetxController {
  var addressList = <Map<String, dynamic>>[].obs;

  /// ----------------- save, update and Fetch all addresses from Firestore-------------------
  Future<void> fetchAddresses() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Users').doc(uid).collection('address').get();

    addressList.value = snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      data['docId'] = doc.id;
      return data;
    }).toList();
  }


  Future<void> saveCurrentLocationAddress() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks.first;

    Map<String, dynamic> addressData = {
      'streetaddress': "${place.street ?? ''} ${place.subLocality ?? ''}".trim(),
      'zipcode': place.postalCode ?? '',
      'city': place.locality ?? '',
      'state': place.administrativeArea ?? '',
      'country': place.country ?? '',
      'lattitude': position.latitude.toString(),
      'longitude': position.longitude.toString(),
      'status': true,
    };

    await FirebaseFirestore.instance.collection('Users')
        .doc(uid)
        .collection('address')
        .add(addressData);


    await fetchAddresses();
  }


  Future<void> updateAddress(String docId, Map<String, dynamic> updatedData) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    await FirebaseFirestore.instance.collection('Users').doc(uid).collection('address').doc(docId).update(updatedData);

    await fetchAddresses();
  }
  Future<void> addManualAddress({
    required String street,
    required String city,
    required String state,
    required String country,
    required String zipcode,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    Map<String, dynamic> addressData = {
      'streetaddress': street,
      'zipcode': zipcode,
      'city': city,
      'state': state,
      'country': country,
      'lattitude': '',   // manual entry me lat/long blank reh skte hain
      'longitude': '',
      'status': false,   // manual wali default false rakhi
    };

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('address')
        .add(addressData);

    await fetchAddresses(); // list refresh ho jaye
  }

}

