import 'package:get/get.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/address_contreoller.dart';
import '../../../linker/linker.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({super.key});

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
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddressScreen()),
              );
            },
            icon: Icon(
              Icons.add_circle_outline,
              size: 20,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Obx(() {
              if (addressController.addressList.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children:
                List.generate(addressController.addressList.length, (index) {
                  final address = addressController.addressList[index];
                  final docId = address['docId'] ?? '';

                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: const Color(0xffEBFFD7),
                            child: Icon(Icons.home, color: AppColors.greencolor),
                          ),
                          title: Text(
                            address['streetaddress'] ?? '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "${address['city'] ?? ''}, ${address['state'] ?? ''}, ${address['country'] ?? ''} ${address['zipcode'] ?? ''}",
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              expandedIndex.value == index
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              color: AppColors.greencolor,
                            ),
                            onPressed: () {
                              expandedIndex.value =
                              expandedIndex.value == index ? -1 : index;
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
                                TextFeildWidget(
                                  hintext: 'Street Address',
                                  prefixIcons: Icons.home,
                                  controller: streetController,
                                  color: AppColors.whiteColor,
                                ),
                                TextFeildWidget(
                                  hintext: 'City',
                                  prefixIcons: Icons.location_city,
                                  controller: cityController,
                                  color: AppColors.whiteColor,
                                ),
                                TextFeildWidget(
                                  hintext: 'State',
                                  prefixIcons: Icons.map,
                                  controller: stateController,
                                  color: AppColors.whiteColor,
                                ),
                                TextFeildWidget(
                                  hintext: 'Country',
                                  prefixIcons: Icons.public,
                                  controller: countryController,
                                  color: AppColors.whiteColor,
                                ),
                                TextFeildWidget(
                                  hintext: 'Zipcode',
                                  prefixIcons: Icons.local_post_office,
                                  controller: zipcodeController,
                                  color: AppColors.whiteColor,
                                ),
                                TextFeildWidget(
                                  hintext: 'Latitude',
                                  prefixIcons: Icons.my_location,
                                  controller: latitudeController,
                                  color: AppColors.whiteColor,
                                ),
                                TextFeildWidget(
                                  hintext: 'Longitude',
                                  prefixIcons: Icons.explore,
                                  controller: longitudeController,
                                  color: AppColors.whiteColor,
                                ),
                                SizedBox(height: 10),
                                GreenTextButton(
                                  text: 'Update Address',
                                  ontap: () async {
                                    await addressController.updateAddress(
                                      docId,
                                      {
                                        'streetaddress':
                                        streetController.text.trim(),
                                        'city': cityController.text.trim(),
                                        'state': stateController.text.trim(),
                                        'country': countryController.text.trim(),
                                        'zipcode':
                                        zipcodeController.text.trim(),
                                        'lattitude':
                                        latitudeController.text.trim(),
                                        'longitude':
                                        longitudeController.text.trim(),
                                      },
                                    );
                                    expandedIndex.value = -1;
                                  },
                                ),
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
                await addressController.saveCurrentLocationAddress();
              },
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
