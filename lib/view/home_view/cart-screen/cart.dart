//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'package:get/get.dart';
// import 'package:groceryapp_with_firebase/controller/FirebaseController/cart_controller.dart';
// import 'package:groceryapp_with_firebase/view/check_out/checkout_screen.dart';
// import 'package:groceryapp_with_firebase/view/home_view/cart-screen/shipping_address.dart';
//
// import '../../../controller/FirebaseController/productlist_Controller/productlist_controller.dart';
// import '../../../linker/linker.dart';
//
// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   List<String> images = [
//     AppIcons.broccoli,
//     AppIcons.grapes,
//     AppIcons.aocado,
//     AppIcons.pineapple,
//     AppIcons.pomegrante,
//   ];
//   List<String> text = [
//     'Fresh Broccoli',
//     'fresh Black Grapes',
//     'fresh Avacada',
//     'fresh Pineapple',
//     'fresh Pomegrante',
//   ];
//   List<String> price = [
//     '1.50 lbs',
//     '5.0 lbs',
//     '1.50 lbs',
//     'dozen',
//     'dozen',
//   ];
//   List<Color> appColor = [
//     Color(0xffD2FFD0),
//     AppColors.lightredcolor,
//     Color(0xffFCFFD9),
//     Color(0xffFFE6C2),
//     AppColors.lightredcolor,
//   ];
//   final firebaseController = Get.put(FirebaseController());
//   final cartController = Get.put(CartController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.whiteColor,
//         title: BlackTextWidget(
//           text: 'Shopping Cart',
//           fontWeight: FontWeight.w500,
//           fontSize: 18,
//         ),
//         centerTitle: true,
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Image(
//               image: AssetImage(AppIcons.backicon),
//               color: AppColors.blackColor,
//             )),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Column(children: [
//             SizedBox(
//               height: 25,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: text.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(
//                     bottom: 10.0,
//                   ),
//                   child: Container(
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 90,
//                           width: 90,
//                           decoration: BoxDecoration(
//                             color: appColor[index],
//                             shape: BoxShape.circle,
//                           ),
//                           child: Image(
//                             image: AssetImage(images[index]),
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   BlackTextWidget(
//                                     text: '\$2.22 x 4 ',
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w500,
//                                     textColor: AppColors.greencolor,
//                                   ),
//                                   Icon(
//                                     Icons.add,
//                                     color: AppColors.greencolor,
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   BlackTextWidget(
//                                     text: text[index],
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                   Text(
//                                     '5',
//                                     style: TextStyle(
//                                         color: AppColors.greencolor,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   GreyText(text: price[index]),
//                                   Icon(
//                                     Icons.minimize,
//                                     color: AppColors.greencolor,
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 20,),
//             Container(
//               height: 220,
//               width: 414,
//               decoration: BoxDecoration(
//                 color: AppColors.whiteColor,
//               ),
//               child: Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Column(
//                     children: [
//                       SizedBox(height: 20,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           BlackTextWidget(text: 'Subtotal',textColor: AppColors.greyColor,fontWeight: FontWeight.w500,fontSize: 12,),
//                           BlackTextWidget(text: '\$56.7',textColor: AppColors.greyColor,fontWeight: FontWeight.w500,fontSize: 12,),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           BlackTextWidget(text: 'Shipping charges',textColor: AppColors.greyColor,fontWeight: FontWeight.w500,fontSize: 12,),
//                           BlackTextWidget(text: '\$1.6',textColor: AppColors.greyColor,fontWeight: FontWeight.w500,fontSize: 12,),
//                         ],
//                       ),
//                       SizedBox(height: 10,),
//                       Divider(thickness: 1,color: AppColors.greyColor,),
//                       SizedBox(height: 10,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           BlackTextWidget(text: 'Total',fontSize: 18,fontWeight: FontWeight.w600,),
//                           BlackTextWidget(text: '\$58.2',fontSize: 18,fontWeight: FontWeight.w600,),
//                         ],
//                       ),
//                       SizedBox(height: 20,),
//                       // GreenTextButton(text: 'Checkout', ontap: (){
//                       //   cartController.addToCart(product);
//                       //   Get.snackbar("Cart", "${product["productName"]} added to cart");
//                       //   Get.to(CheckoutScreen());
//                       // }),
//                       IconButton(
//                         icon: Icon(Icons.add_shopping_cart, color: Colors.green),
//                         onPressed: () {
//                           cartController.addToCart(firebaseController.productsList[index]);
//                           Get.snackbar(
//                             "Cart",
//                             "${firebaseController.productsList[index]["productName"]} added to cart",
//                           );
//                         },
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/cart_controller.dart';

import 'package:groceryapp_with_firebase/controller/FirebaseController/productlist_Controller/productlist_controller.dart';
import 'package:groceryapp_with_firebase/linker/linker.dart';
import 'package:groceryapp_with_firebase/view/check_out/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final firebaseController = Get.put(FirebaseController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: BlackTextWidget(
          text: 'Shopping Cart',
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image(
            image: AssetImage(AppIcons.backicon),
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(child: Text("🛒 Your cart is empty"));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(height: 25),
                // ✅ Cart Items
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    var item = cartController.cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color: AppColors.lightredcolor,
                                shape: BoxShape.circle,
                              ),
                              child: item["productImage"] != null && item["productImage"].toString().isNotEmpty
                                ? Image.network(item["productImage"])
                                : Icon(Icons.shopping_bag, color: AppColors.greencolor),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ✅ Price row
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      BlackTextWidget(
                                        text:
                                        "\$${item["productPrice"]} x ${item["quantity"]}",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        textColor: AppColors.greencolor,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add,
                                            color: AppColors.greencolor),
                                        onPressed: () {
                                          cartController.increaseQty(item["productId"]);
                                        },
                                      ),
                                    ],
                                  ),
                                  // ✅ Name + qty
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      BlackTextWidget(
                                        text: item["productName"] ?? "",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      Text(
                                        "${item["quantity"]}",
                                        style: TextStyle(
                                          color: AppColors.greencolor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // ✅ Unit + minus
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      GreyText(text: item["productUnit"] ?? ""),
                                      IconButton(
                                        icon: Icon(Icons.remove,
                                            color: AppColors.greencolor),
                                        onPressed: () {
                                          cartController.decreaseQty(item["productId"]);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 20),

                // ✅ Bottom Summary & Checkout
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlackTextWidget(
                              text: 'Subtotal',
                              textColor: AppColors.greyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            BlackTextWidget(
                              text: '\$${cartController.totalPrice}',
                              textColor: AppColors.greyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlackTextWidget(
                              text: 'Shipping charges',
                              textColor: AppColors.greyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                            BlackTextWidget(
                              text: '\$1.6',
                              textColor: AppColors.greyColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 1, color: AppColors.greyColor),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BlackTextWidget(
                              text: 'Total',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            BlackTextWidget(
                              text:
                              '\$${(cartController.totalPrice + 1.6).toStringAsFixed(2)}',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        GreenTextButton(
                          text: 'Checkout',
                          ontap: () {
                            Get.to(() => CheckoutScreen());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
