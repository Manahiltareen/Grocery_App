import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../linker/linker.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/address_contreoller.dart';


class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final addressController = Get.find<AddressController>();

  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final zipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: BlackTextWidget(
          text: 'Add New Address',
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: AppColors.blackColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFeildWidget(
              hintext: "Street Address",
              prefixIcons: Icons.home,
              controller: streetController,
              textInputType: TextInputType.text,
              color: AppColors.lightredcolor,
            ),
            SizedBox(height: 10),
            TextFeildWidget(
              hintext: "City",
              prefixIcons: Icons.location_city,
              controller: cityController,
              textInputType: TextInputType.text,
              color: AppColors.lightredcolor,
            ),
            SizedBox(height: 10),
            TextFeildWidget(
              hintext: "State",
              prefixIcons: Icons.map,
              controller: stateController,
              textInputType: TextInputType.text,
              color: AppColors.lightredcolor,
            ),
            SizedBox(height: 10),
            TextFeildWidget(
              hintext: "Country",
              prefixIcons: Icons.flag,
              controller: countryController,
              textInputType: TextInputType.text,
              color: AppColors.lightredcolor,
            ),
            SizedBox(height: 10),
            TextFeildWidget(
              hintext: "Zip Code",
              prefixIcons: Icons.local_post_office,
              controller: zipController,
              textInputType: TextInputType.number,
              color: AppColors.lightredcolor,
            ),
            SizedBox(height: 20),
            GreenTextButton(
              text: "Save Address",
              ontap: () async {
                await addressController.addManualAddress(
                  street: streetController.text.trim(),
                  city: cityController.text.trim(),
                  state: stateController.text.trim(),
                  country: countryController.text.trim(),
                  zipcode: zipController.text.trim(),
                );
                Navigator.pop(context); // wapas address list par
              },
            ),
          ],
        ),
      ),
    );
  }
}
