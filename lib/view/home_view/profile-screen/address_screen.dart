import '../../../linker/linker.dart';
import 'package:get/get.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/address_contreoller.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final AddressController addressController = Get.put(AddressController());

  @override
  void initState() {
    super.initState();
    addressController.fetchAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: BlackTextWidget(text: 'My Address', fontWeight: FontWeight.w600, fontSize: 18,),
        centerTitle: true,
        leading: Image(image: AssetImage(AppIcons.backicon), color: AppColors.blackColor,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:18.0),
            child: Image(image: AssetImage(AppIcons.search2), color: AppColors.blackColor,),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          GreenTextButton(
            text: 'Save Current Location Address',
            ontap: () async {
              await addressController.saveCurrentLocationAddress();
            }
          ),
          SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              if (addressController.addressList.isEmpty) {
                return Center(child: Text('No address found'));
              }
              return ListView.builder(
                itemCount: addressController.addressList.length,
                itemBuilder: (context, index) {
                  final address = addressController.addressList[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ListTile(
                      title: Text(address['streetaddress'] ?? ''),
                      subtitle: Text(
                        "${address['city'] ?? ''}, ${address['state'] ?? ''}, ${address['country'] ?? ''} ${address['zipcode'] ?? ''}\n"
                        "Lat: ${address['lattitude'] ?? ''}, Long: ${address['longitude'] ?? ''}"
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

