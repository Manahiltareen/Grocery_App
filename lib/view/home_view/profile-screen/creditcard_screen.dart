//
//
//
// import 'package:get_storage/get_storage.dart';
//
// import '../../../linker/linker.dart';
//
// class CreditcardScreen extends StatefulWidget {
//   const CreditcardScreen({super.key});
//
//   @override
//   State<CreditcardScreen> createState() => _CreditcardScreenState();
// }
//
// class _CreditcardScreenState extends State<CreditcardScreen> {
//   TextEditingController nameController=TextEditingController();
//   TextEditingController addressController=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.whiteColor,
//         title: BlackTextWidget(text: 'My Cards',fontWeight: FontWeight.w500,fontSize: 18,),
//         centerTitle: true,
//         leading: InkWell(
//             onTap: (){
//             },
//             child: Image(image: AssetImage(AppIcons.backicon),color: AppColors.blackColor,)),
//         actions: [
//           IconButton(onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCard(userId: GetStorage().read("uid"),)));
//           }, icon:Icon(Icons.add_circle_outline,size: 18,color: AppColors.blackColor,)),
//         ],
//       ),
//       body:SingleChildScrollView(
//         child: Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: Column(
//                 children: [
//                   SizedBox(height: 40,),
//                   Container(
//                     height:400,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: AppColors.whiteColor,
//                     ),
//                     child: Column(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                             ),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   height: 65,
//                                   width: 65,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xffF5F5F5),
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Image(image: AssetImage(AppIcons.circle,),),
//                                 ),
//                                 SizedBox(width: 12),
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       BlackTextWidget(text: 'Master Card',fontSize: 18,fontWeight: FontWeight.w600,),
//                                       Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Text("XXXX  XXXX  XXXX  5678",
//                                                 style: TextStyle(color: Colors.grey,fontWeight:FontWeight.w400,fontSize: 10)),
//                                             Icon(Icons.expand_circle_down_outlined,color: AppColors.greencolor,),
//                                           ]),
//                                       Row(
//                                         children: [
//                                           Text('Expiry : 01/22'),
//                                           SizedBox(width: 30,),
//                                           Text('CVV : 908')
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Divider(thickness: 1,color:   AppColors.greyColor,),
//                           SizedBox(height: 30,),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                             child: TextFeildWidget(hintext: 'Russell Austin', prefixIcons:Icons.account_circle_outlined, controller: nameController, color:
//                             Color(0xffF4F5F9)),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                             child: TextFeildWidget(hintext: 'XXXX  XXXX  XXXX  5678', prefixIcons:Icons.margin, controller: addressController, color: Color(0xffF4F5F9)),
//                           ),
//                           Row(
//                             children: [
//                               SizedBox(width: 10,),
//                               Container(
//                                 height:50 ,
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.lightGrey,
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 20,),
//                                     Icon(Icons.date_range,color: AppColors.greyColor,),
//                                     SizedBox(width: 20,),
//                                     BlackTextWidget(text: '01/22',fontSize: 10,fontWeight: FontWeight.w400,)
//                                   ],
//                                 ),
//                               ),
// SizedBox(width: 10,),
//                               Container(
//                                 height:50 ,
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   color: AppColors.lightGrey,
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(width: 20,),
//                                     Icon(Icons.lock_outline,color: AppColors.greyColor,),
//                                     SizedBox(width: 20,),
//                                     BlackTextWidget(text: '908',fontSize: 10,fontWeight: FontWeight.w400,)
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )
//                         ]
//                     ),
//                   ),
//                   SizedBox(height: 30,),
//                   Container(
//                     height:110,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: AppColors.whiteColor,
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                           ),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: 65,
//                                 width: 65,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xffF5F5F5),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Image(image: AssetImage(AppIcons.visa,),),
//                               ),
//                               SizedBox(width: 12),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     BlackTextWidget(text: 'Visa Card',fontSize: 18,fontWeight: FontWeight.w600,),
//                                     Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text("XXXX  XXXX  XXXX  5678",
//                                               style: TextStyle(color: Colors.grey,fontWeight:FontWeight.w400,fontSize: 10)),
//                                           Icon(Icons.expand_circle_down_outlined,color: AppColors.greencolor,),
//                                         ]),
//                                     Row(
//                                       children: [
//                                         Text('Expiry : 01/22'),
//                                         SizedBox(width: 30,),
//                                         Text('CVV : 908')
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 15,),
//                   Container(
//                     height:110,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: AppColors.whiteColor,
//                     ),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                           ),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: 65,
//                                 width: 65,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xffF5F5F5),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Image(image: AssetImage(AppIcons.circle,),),
//                               ),
//                               SizedBox(width: 12),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     BlackTextWidget(text: 'Master Card',fontSize: 18,fontWeight: FontWeight.w600,),
//                                     Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text('XXXX  XXXX  XXXX  5678',
//                                               style: TextStyle(color: Colors.grey,fontWeight:FontWeight.w400,fontSize: 10)),
//                                           Icon(Icons.expand_circle_down_outlined,color: AppColors.greencolor,),
//                                         ]),
//                                     Row(
//                                       children: [
//                                         Text('Expiry : 01/22'),
//                                         SizedBox(width: 30,),
//                                         Text('CVV : 908')
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 40,),
//                   GreenTextButton(text: 'Save settings', ontap: (){}),
//                   SizedBox(height: 40,),
//                 ]
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:groceryapp_with_firebase/controller/FirebaseController/payment_controller.dart';
// import 'package:groceryapp_with_firebase/controller/components/text-class.dart';
// import 'package:groceryapp_with_firebase/controller/utils/constants/appcolors/app_color.dart';
// import 'package:groceryapp_with_firebase/controller/utils/constants/appicons/app_icons.dart';
// import 'package:groceryapp_with_firebase/model/credit_card_model/credit_card_model.dart';
//
// import 'my_card.dart';
//
// class CreditcardScreen extends StatelessWidget {
//   const CreditcardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final PaymentController paymentController = Get.put(PaymentController());
//     final String userId = GetStorage().read("uid");
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.whiteColor,
//         title: BlackTextWidget(
//           text: 'My Cards',
//           fontWeight: FontWeight.w500,
//           fontSize: 18,
//         ),
//         centerTitle: true,
//         leading: InkWell(
//           onTap: () => Navigator.pop(context),
//           child: Image.asset(AppIcons.backicon, color: AppColors.blackColor),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => MyCard(userId: userId),
//                 ),
//               );
//             },
//             icon: Icon(Icons.add_circle_outline,
//                 size: 18, color: AppColors.blackColor),
//           ),
//         ],
//       ),
//       body: StreamBuilder<List<CardModel>>(
//         stream: paymentController.fetchCards(userId),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("No cards added yet"));
//           }
//
//           final cards = snapshot.data!;
//           return ListView.builder(
//             itemCount: cards.length,
//             itemBuilder: (context, index) {
//               final card = cards[index];
//               return Card(
//                 margin: const EdgeInsets.all(10),
//                 child: ListTile(
//                    leading: card.cardType == "Visa" ? Image.asset(
//                   "assets/icons/visa.png",
//                   width: 40,
//                   height: 40,
//                 )
//                     : card.cardType == "MasterCard" ? Image.asset(
//                 "assets/icons/mastercard.png",
//                 width: 40,
//                 height: 40,
//               )
//                       : card.cardType == "Mast"
//                 ? Image.asset(
//                 "assets/icons/mastercard.png",
//                 width: 40,
//                   height: 40,
//                 )
//                     : Icon(
//                 Icons.credit_card,
//                 color: Colors.grey,
//               ),
//
//               title: Text("${card.cardType} - ${card.cardNumber}"),
//                   subtitle: Text("Expiry: ${card.expiryDate} | CVV: ${card.cvv}"),
//                   trailing: Text(card.cardHolder),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/payment_controller.dart';
import 'package:groceryapp_with_firebase/controller/components/text-class.dart';
import 'package:groceryapp_with_firebase/controller/utils/constants/appcolors/app_color.dart';
import 'package:groceryapp_with_firebase/controller/utils/constants/appicons/app_icons.dart';
import 'package:groceryapp_with_firebase/model/credit_card_model/credit_card_model.dart';

import 'my_card.dart';

class CreditcardScreen extends StatelessWidget {
  const CreditcardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.put(PaymentController());
    final String userId = GetStorage().read("uid");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: BlackTextWidget(
          text: 'My Cards',
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset(AppIcons.backicon, color: AppColors.blackColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MyCard(userId: userId),
                ),
              );
            },
            icon: Icon(Icons.add_circle_outline,
                size: 18, color: AppColors.blackColor),
          ),
        ],
      ),
      body: StreamBuilder<List<CardModel>>(
        stream: paymentController.fetchCards(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No cards added yet"));
          }

          final cards = snapshot.data!;
          return ListView.builder(
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Card Icon
                    Container(
                      height: 65,
                      width: 65,
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F5F5),
                        shape: BoxShape.circle,
                      ),
                      child: card.cardType == "Visa"
                          ? Image.asset("assets/icons/visa.png")
                          : card.cardType == "MasterCard"
                          ? Image.asset("assets/icons/mastercard.jpeg")
                          : card.cardType == "American Express"
                          ? Image.asset("assets/icons/american express.jpeg")
                          : Icon(Icons.credit_card,
                          size: 40, color: Colors.grey),
                    ),
                    const SizedBox(width: 12),
                    // 🔹 Card Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlackTextWidget(
                            text: "${card.cardType} Card",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "XXXX  XXXX  XXXX  ${card.cardNumber.substring(card.cardNumber.length - 4)}",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),

                             Checkbox(
                                value: card.isDefault,
                                activeColor: AppColors.greencolor,
                                onChanged: (bool? value) {
                                  ObxState();
                                  if (value == true) {
                                    paymentController.setDefaultCard(userId, card.id);
                                  }
                                },
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Text("Expiry : ${card.expiryDate}"),
                              const SizedBox(width: 30),
                              Text("CVV : ${card.cvv}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Holder : ${card.cardHolder}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
