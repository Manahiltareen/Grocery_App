import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/FirebaseController/productlist_Controller/productlist_controller.dart';
import '../../../controller/components/grid_list.dart';
import '../../../controller/utils/constants/appicons/app_icons.dart';
import '../../../model/product_model/grid_product_list.dart';
// class FruitsScreen extends StatelessWidget {
//   FruitsScreen({super.key});
//   List<GridContainer> gridProduct=[
//     GridContainer(color: Color(0xffFFCEC1), text: 'Fresh Peach',
//         image:AppIcons.peach , price: '\$8.00', subtitle:
//         'dozen', cartprice: 'Add to cart'),
//     GridContainer(color: Color(0xffFCFFD9), text: 'Avacoda',
//         image:AppIcons.aocado , price: '\$7.00', subtitle:
//         '2.0 lbs' , cartprice: '1'),
//     GridContainer(color: Color(0xffFFE6C2), text: 'Pineapple',
//         image:AppIcons.pineapple , price:'\$9.90'
//         , subtitle: '1.50 lbs', cartprice: 'add to cart'),
//     GridContainer(color: Color(0xffFEE1ED), text: 'Black Grapes',
//         image:AppIcons.grapes , price:'\$7.05' , subtitle: '5.0 lbs', cartprice: 'add to cart'),
//     GridContainer(color: Color(0xffFFE3E2), text: 'Pomegranate',
//         image:AppIcons.pomegrante , price:'\$2.09',
//         subtitle: '1.50 lbs', cartprice:'1'),
//     GridContainer(color: Color(0xffD2FFD0),
//         text: 'Fresh B roccoli', image:AppIcons.broccoli ,
//         price: '\$3.00', subtitle:'1 kg', cartprice:
//         'Add to cart'),
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('fruits'),
//       ),
//       body:Expanded(
//         child: Column(
//           children: [
//             GridList(products: gridProduct),
//           ],
//         ),
//       ) ,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/FirebaseController/productlist_Controller/productlist_controller.dart';
import '../../../linker/linker.dart';

class FruitsScreen extends StatelessWidget {
  final String catId;
  final String catName;

  FruitsScreen({super.key, required this.catId, required this.catName});

  final FirebaseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.fetchProductsByCategory(catId);

    return Scaffold(
      appBar: AppBar(
        title: Text(catName),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.productsList.isEmpty) {
          return Center(child: Text("No products found"));
        }

        return GridList(
          products: controller.productsList.map((prod) {
            return GridContainer(
              color: Color(0xffD2FFD0),

              text: prod["productName"] as String? ?? "No Name",
              image: "assets/icons/aocado-2 1.png",
              price: prod["productPrice"]?.toString() ?? "0.0",
              subtitle: prod["productUnit"] as String? ?? "",
              cartprice: 'Add to cart',
            );
          }).toList(),
        );
      }),
    );
  }
}
