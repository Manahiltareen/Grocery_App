// import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
// import 'package:get/get.dart';
//
// class FirebaseController extends GetxController{
//   RxList<Map<String, dynamic>> productsList = <Map<String, dynamic>>[].obs;
//   var allProducts = <Map<String, dynamic>>[].obs;
//
//
//
//   final  FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   RxBool isLoading = false.obs;
//   /// category k products
//   Future<void> fetchProductsByCategory(String catId) async {
//     isLoading.value = true;
//     allProducts.clear();
//     try {
//       QuerySnapshot prodSnapshot = await _firestore
//           .collection("Categories")
//           .doc(catId)
//           .collection("Products")
//           .get();
//
//       for (var prodDoc in prodSnapshot.docs) {
//         allProducts.add(prodDoc.data() as Map<String, dynamic>);
//       }
//     } catch (e) {
//       print("Error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
// }
//
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<Map<String, dynamic>> categoriesList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> productsList = <Map<String, dynamic>>[].obs;
  RxBool isLoading = false.obs;

  /// ✅ Fetch Categories
  Future<void> fetchCategories() async {
    isLoading.value = true;
    try {
      QuerySnapshot catSnapshot = await _firestore.collection("Categories").get();
      categoriesList.value = catSnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return {
          "catId": doc.id,
          "Name": data["Name"] ?? "No Name",
        };
      }).toList();
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// ✅ Fetch Products by Category
  Future<void> fetchProductsByCategory(String catId) async {
    isLoading.value = true;
    try {
      QuerySnapshot prodSnapshot = await _firestore
          .collection("Categories")
          .doc(catId)
          .collection("Products")
          .get();

      productsList.value = prodSnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        return {
          "productId": doc.id,
          "productName": data["productName"] ?? "No Name",
          "productUnit": data["productUnit"] ?? "",
          "productPrice": data["productPrice"] ?? "",
          "catId" : data["catId"]  ?? "",
          // "image": data["image"] ?? "",
        };
      }).toList();
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
