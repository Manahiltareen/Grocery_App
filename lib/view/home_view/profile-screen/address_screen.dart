import '../../../linker/linker.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController adddresController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController zipcodeController=TextEditingController();
  TextEditingController CountryController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: BlackTextWidget(text: 'My Address',fontWeight: FontWeight.w600,fontSize: 18,),
        centerTitle: true,
        leading: Image(image: AssetImage(AppIcons.backicon),color:
        AppColors.blackColor,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:18.0),
            child: Image(image: AssetImage(AppIcons.search2),color: AppColors.blackColor,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(height: 35,),
              TextFeildWidget(hintext: 'Name', prefixIcon: Icons.person_outline_sharp, controller: nameController, color: AppColors.whiteColor,),
              TextFeildWidget(hintext: 'Email Address', prefixIcon: Icons.email_outlined, controller: emailController, color: AppColors.whiteColor,),
              TextFeildWidget(hintext: 'Phone number', prefixIcon: Icons.phone, controller: phoneNumberController, color: AppColors.whiteColor,),
              TextFeildWidget(hintext: 'Address', prefixIcon: Icons.person_pin_circle, controller: adddresController, color: AppColors.whiteColor,),
              TextFeildWidget(hintext: 'Zip code', prefixIcon: Icons.margin, controller: zipcodeController, color: AppColors.whiteColor,),
              TextFeildWidget(hintext: 'city', prefixIcon: Icons.location_city_outlined, controller: cityController, color: AppColors.whiteColor,),
              TextFeildWidget(hintext: 'Country', prefixIcon: Icons.language, controller: CountryController, color: AppColors.whiteColor,),
              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 15,),
                  Image(image: AssetImage(AppIcons.icon2),color: AppColors.greencolor,),
                  SizedBox(width: 30,),
                  BlackTextWidget(text:'Save this address',fontSize: 12,fontWeight: FontWeight.w400,)
                ],
              ),
              SizedBox(height: 30,),
              GreenTextButton(text: 'Add address', ontap: (){}),
            ],
          ),
        ),
      ),
    );
  }
}
}
