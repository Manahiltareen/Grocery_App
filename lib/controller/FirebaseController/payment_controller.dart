// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:groceryapp_with_firebase/model/credit_card_model/credit_card_model.dart';
//
// class PaymentController extends GetxController {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<void> addCard(String userId, CardModel card) async {
//     try {
//       await _firestore
//           .collection("Users")
//           .doc(userId)
//           .collection("paymentMethods")
//           .add(card.toMap());
//       Get.snackbar("Success", "Card added successfully");
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }
//
//   Stream<List<CardModel>> fetchCards(String userId) {
//     return _firestore
//         .collection("Users")
//         .doc(userId)
//         .collection("paymentMethods")
//         .snapshots()
//         .map((snapshot) =>
//         snapshot.docs.map((doc) => CardModel.fromMap(doc.data())).toList());
//   }
//
//
//
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:groceryapp_with_firebase/model/credit_card_model/credit_card_model.dart';

class PaymentController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔹 Add Card
  Future<void> addCard(String userId, CardModel card) async {
    try {
      await _firestore
          .collection("Users")
          .doc(userId)
          .collection("paymentMethods")
          .add(card.toMap());
      Get.snackbar("Success", "Card added successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // 🔹 Fetch Cards (with id)
  Stream<List<CardModel>> fetchCards(String userId) {
    return _firestore
        .collection("Users")
        .doc(userId)
        .collection("paymentMethods")
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) {
          final card = CardModel.fromMap(doc.data());
          return card.copyWith(id: doc.id);  // ✅ firebase docId set karna
        }).toList());
  }

  // 🔹 Set Default Card
  Future<void> setDefaultCard(String userId, String cardId) async {
    final cardsRef = _firestore
        .collection("Users")
        .doc(userId)
        .collection("paymentMethods");

    try {
      // Sab cards ko false karo
      final allCards = await cardsRef.get();
      for (var doc in allCards.docs) {
        await cardsRef.doc(doc.id).update({'isDefault': false});
      }

      // Select card ko true karo
      await cardsRef.doc(cardId).update({'isDefault': true});
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<CardModel?> getDefaultCard(String userId) async {
    try {
      final snapshot = await _firestore
          .collection("Users")
          .doc(userId)
          .collection("paymentMethods")
          .where("isDefault", isEqualTo: true)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final card = CardModel.fromMap(snapshot.docs.first.data());
        return card.copyWith(id: snapshot.docs.first.id);
      }
      return null;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

}
