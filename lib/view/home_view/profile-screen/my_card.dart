import 'package:flutter/material.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/payment_controller.dart';
import 'package:groceryapp_with_firebase/controller/components/textfield.dart';
import 'package:groceryapp_with_firebase/model/credit_card_model/credit_card_model.dart';

import '../../../controller/components/text-class.dart';
import '../../../controller/utils/constants/appcolors/app_color.dart';
import '../../../controller/utils/constants/appicons/app_icons.dart';
// import 'address_screen.dart';
// class MyCard extends StatefulWidget {
//   const MyCard({super.key});
//
//   @override
//   State<MyCard> createState() => _MyCardState();
// }
//
// class _MyCardState extends State<MyCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         backgroundColor: AppColors.whiteColor,
//         title: BlackTextWidget(text: 'Add Credit Card',fontWeight: FontWeight.w500,fontSize: 18,),
//         centerTitle: true,
//         leading: InkWell(
//             onTap: (){
//               Navigator.pop(context);
//             },
//             child: Image(image: AssetImage(AppIcons.backicon),color: AppColors.blackColor,)),),
//       body: Column(
//         children: [
// Container(
//   height:189 ,
//   width: double.infinity,
//   decoration: BoxDecoration(
//     gradient: LinearGradient(colors: [AppColors.DarkGreen,AppColors.LightGreen])
//   ),
//   child: Stack(
//     children: [
//      Padding(
//        padding: const EdgeInsets.only(top: 20.0,left: 20.0),
//        child: CircleAvatar(
//          backgroundColor: Color(0xffF14336),
//        ),
//      ),
//            Padding(
//              padding: const EdgeInsets.only(left: 50.0,top: 20),
//              child: CircleAvatar(
//                backgroundColor: Color(0xffFFC107),
//              ),
//            ),
//      Positioned(
//        bottom: 0,
//          right: 0,
//          child: Container(
//        height: 50,
//        width: 50,
//        decoration: BoxDecoration(
//          color: Color(0xff6CC51D),
//          borderRadius: BorderRadius.only(topLeft: Radius.circular(50),)
//        ),
//      )
//      ),
//       Padding(
//         padding: const EdgeInsets.only(top: 78.0),
//         child: Row(
//           children: [
//             SizedBox(width: 30,),
//             Text('XXXX',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.whiteColor),),
//             SizedBox(width: 10,),
//             Text('XXXX',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.whiteColor),),
//             SizedBox(width: 10,),
//             Text('XXXX',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.whiteColor),),
//             SizedBox(width: 10,),
//             Text('8790',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.whiteColor),),
//           ],
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 148.0),
//         child: Row(
//           children: [
//             Text('Card holder',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.whiteColor),),
//             SizedBox(width: 50,),
//             Text('Expires',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.whiteColor),),
//           ],
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 125.0),
//         child: Row(
//           children: [
//             Text('XXXX',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.whiteColor),),
//             Text('XXXX',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.whiteColor),),
//           ],
//         ),
//       ),
//    ] ),
// ) ,
//         ],
//       ),
//     );
//   }
// }

import 'package:get/get.dart';



class MyCard extends StatefulWidget {
  final String userId;
  const MyCard({super.key, required this.userId});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final PaymentController paymentController = Get.put(PaymentController());

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();

  String selectedCardType = "Visa";

  Future<void> pickExpiryDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        expiryController.text = "${picked.month}/${picked.year % 100}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: BlackTextWidget(
          text: 'Add Credit Card',
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset(AppIcons.backicon, color: AppColors.blackColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Dropdown for card type
            DropdownButtonFormField<String>(
              value: selectedCardType,
              items: ["Visa", "MasterCard", "American Express"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => selectedCardType = val!),
              decoration: InputDecoration(
                labelText: "Card Type",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFeildWidget(
              hintext: "Card Number",
              prefixIcons: Icons.credit_card,
              controller: cardNumberController,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            TextFeildWidget(
              hintext: "Card Holder",
              prefixIcons: Icons.person,
              controller: cardHolderController,
              textInputType: TextInputType.text,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            // Expiry Date
            InkWell(
              onTap: pickExpiryDate,
              child: IgnorePointer(
                child: TextFeildWidget(
                  hintext: "Expiry Date (MM/YY)",
                  prefixIcons: Icons.date_range,
                  controller: expiryController,
                  textInputType: TextInputType.text,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFeildWidget(
              hintext: "CVV",
              prefixIcons: Icons.lock,
              controller: cvvController,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final card = CardModel(
                  cardNumber: cardNumberController.text,
                  cardHolder: cardHolderController.text,
                  expiryDate: expiryController.text,
                  cardType: selectedCardType,
                  cvv: cvvController.text, isDefault: false,
                );

                paymentController.addCard(widget.userId, card);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.DarkGreen,
              ),
              child: const Text("Save Card"),
            ),
          ],
        ),
      ),
    );
  }
}
