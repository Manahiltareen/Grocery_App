import 'package:get/get.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/address_contreoller.dart';

import '../../../linker/linker.dart';

class MyAddressScreen extends StatefulWidget {
  MyAddressScreen({super.key});

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  final AddressController addressController = Get.put(AddressController());
  // Controllers for editing
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  RxInt expandedIndex = (-1).obs;

  @override
  void initState() {
    super.initState();
    addressController.fetchAddresses();
  }

  void fillControllers(Map<String, dynamic> address) {
    streetController.text = address['streetaddress'] ?? '';
    cityController.text = address['city'] ?? '';
    stateController.text = address['state'] ?? '';
    countryController.text = address['country'] ?? '';
    zipcodeController.text = address['zipcode'] ?? '';
    latitudeController.text = address['lattitude'] ?? '';
    longitudeController.text = address['longitude'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: BlackTextWidget(
          text: 'My Address',
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
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddressScreen()));
              },
              icon: Icon(
                Icons.add_circle_outline,
                size: 18,
                color: AppColors.blackColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Obx(() {
              if (addressController.addressList.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: List.generate(addressController.addressList.length, (index) {
                  final address = addressController.addressList[index];
                  final docId = address['docId'] ?? '';
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffEBFFD7),
                            child: Image(image: AssetImage(AppIcons.address)),
                          ),
                          title: Text(address['streetaddress'] ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("${address['city'] ?? ''}, ${address['state'] ?? ''}, ${address['country'] ?? ''} ${address['zipcode'] ?? ''}"),
                          trailing: IconButton(
                            icon: Icon(
                              expandedIndex.value == index
                                ? Icons.expand_less
                                : Icons.expand_more,
                              color: AppColors.greencolor,
                            ),
                            onPressed: () {
                              expandedIndex.value = expandedIndex.value == index ? -1 : index;
                              if (expandedIndex.value == index) {
                                fillControllers(address);
                              }
                            },
                          ),
                        ),
                        if (expandedIndex.value == index)
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                TextFeildWidget(hintext: 'Street Address', controller: streetController, color: AppColors.whiteColor),
                                TextFeildWidget(hintext: 'City', controller: cityController, color: AppColors.whiteColor),
                                TextFeildWidget(hintext: 'State', controller: stateController, color: AppColors.whiteColor),
                                TextFeildWidget(hintext: 'Country', controller: countryController, color: AppColors.whiteColor),
                                TextFeildWidget(hintext: 'Zipcode', controller: zipcodeController, color: AppColors.whiteColor),
                                TextFeildWidget(hintext: 'Latitude', controller: latitudeController, color: AppColors.whiteColor),
                                TextFeildWidget(hintext: 'Longitude', controller: longitudeController, color: AppColors.whiteColor),
                                SizedBox(height: 10),
                                GreenTextButton(
                                  text: 'Update Address',
                                  ontap: () async {
                                    await addressController.updateAddress(
                                      docId,
                                      {
                                        'streetaddress': streetController.text.trim(),
                                        'city': cityController.text.trim(),
                                        'state': stateController.text.trim(),
                                        'country': countryController.text.trim(),
                                        'zipcode': zipcodeController.text.trim(),
                                        'lattitude': latitudeController.text.trim(),
                                        'longitude': longitudeController.text.trim(),
                                      }
                                    );
                                    expandedIndex.value = -1;
                                  }
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              );
            }),
            SizedBox(height: 20),
            GreenTextButton(
              text: 'Fetch Current Location & Save',
              ontap: () async {
                await addressController.fetchCurrentLocationAddress();
              }
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
                      hintext: 'Address',
                      prefixIcons: Icons.location_on,
                      controller: addressController,
                      color: Color(0xffF4F5F9)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFeildWidget(
                      hintext: 'city',
                      prefixIcons: Icons.location_city_sharp,
                      controller: cityController,
                      color: Color(0xffF4F5F9)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFeildWidget(
                      hintext: 'Zip code',
                      prefixIcons: Icons.margin,
                      controller: zipcodeController,
                      color: Color(0xffF4F5F9)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFeildWidget(
                      hintext: 'Country',
                      prefixIcons: Icons.language,
                      controller: countryController,
                      color: Color(0xffF4F5F9)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFeildWidget(
                      hintext: 'Phone number',
                      prefixIcons: Icons.phone_outlined,
                      controller: phonenumberController,
                      color: Color(0xffF4F5F9)),
                ),
                Row(
                  children: [
                    BlackTextWidget(
                      text: 'Make default',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ],
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Color(0xffEBFFD7),
                            shape: BoxShape.circle,
                          ),
                          child: Image(
                            image: AssetImage(
                              AppIcons.address,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlackTextWidget(
                                text: 'Jissca Simpson',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "2811 Crescent Day. LA Port \n California, United States 77571",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10)),
                                    Icon(
                                      Icons.expand_circle_down_outlined,
                                      color: AppColors.greencolor,
                                    ),
                                  ]),
                              SizedBox(
                                height: 4,
                              ),
                              BlackTextWidget(
                                text: '+1  202  555  0142 ',
                                textColor: AppColors.blackColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Obx(() {
              if (addressController.addressList.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: List.generate(addressController.addressList.length, (index) {
                  final address = addressController.addressList[index];
                  final docId = address['docId'] ?? ''; // You must add docId in fetchAddresses
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffEBFFD7),
                            child: Image(image: AssetImage(AppIcons.address)),
                          ),
                          title: Text(address['streetaddress'] ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("${address['city'] ?? ''}, ${address['state'] ?? ''}, ${address['country'] ?? ''} ${address['zipcode'] ?? ''}"),
                          trailing: IconButton(
                            icon: Icon(
                              expandedIndex.value == index
                                ? Icons.expand_less
                                : Icons.expand_more,
                              color: AppColors.greencolor,
                            ),
                            onPressed: () {
                              expandedIndex.value = expandedIndex.value == index ? -1 : index;
                              if (expandedIndex.value == index) {
                                fillControllers(address);
                              }
                            },
                          ),
                        ),
                        if (expandedIndex.value == index)
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                TextFeildWidget(hintext: 'Street Address', controller: streetController, color: AppColors.whiteColor),
                                TextFeildWidget(hintext: 'City', controller: cityController, color: AppColors.whiteColor),
                                TextFeildWidget(hintext: 'State', controller: stateController, color: AppColors.whiteColor),
                                TextFeildWidget(hintext: 'Country', controller: countryController, color: AppColors.whiteColor),
                                TextFeildWidget(hintext: 'Zipcode', controller: zipcodeController, color: AppColors.whiteColor),
                                TextFeildWidget(hintext: 'Latitude', controller: latitudeController, color: AppColors.whiteColor),
                                TextFeildWidget(hintext: 'Longitude', controller: longitudeController, color: AppColors.whiteColor),
                                SizedBox(height: 10),
                                GreenTextButton(
                                  text: 'Update Address',
                                  ontap: () async {
                                    await addressController.updateAddress(
                                      docId,
                                      {
                                        'streetaddress': streetController.text.trim(),
                                        'city': cityController.text.trim(),
                                        'state': stateController.text.trim(),
                                        'country': countryController.text.trim(),
                                        'zipcode': zipcodeController.text.trim(),
                                        'lattitude': latitudeController.text.trim(),
                                        'longitude': longitudeController.text.trim(),
                                      }
                                    );
                                    expandedIndex.value = -1;
                                  }
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              );
            }),
            SizedBox(
              height: 20,
            ),
            GreenTextButton(
              text: 'Fetch Current Location & Save',
              ontap: () async {
                await addressController.fetchCurrentLocationAddress();
              }
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
