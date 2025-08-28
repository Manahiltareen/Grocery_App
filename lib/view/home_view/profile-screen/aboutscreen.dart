import '../../../linker/linker.dart';
import 'package:get/get.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/auth_controller.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  TextEditingController passwordController=TextEditingController();
  TextEditingController passwordConfirmController=TextEditingController();
  TextEditingController checkPasswordController=TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: BlackTextWidget(text: 'About me',fontSize: 
        18,fontWeight: FontWeight.w500,),
        centerTitle: true,
        leading: Image(image: AssetImage(AppIcons.backicon,),color: AppColors.blackColor,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              BlackTextWidget(text:'Personal Details',
                fontWeight: FontWeight.w600,fontSize: 18, ),
              SizedBox(height: 20,),
              Obx(() => Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                ),
                child: Row(
                  children: [
                    Image(image: AssetImage(AppIcons.person)),
                    SizedBox(width: 20,),
                    GreyText(text: authController.username.value.isNotEmpty
                      ? authController.username.value
                      : 'Username'),
                  ],
                ),
              )),
              SizedBox(height: 15,),
              Obx(() => Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                ),
                child: Row(
                  children: [
                    Icon(Icons.email_outlined, color: AppColors.greyColor,),
                    SizedBox(width: 20,),
                    GreyText(
                      text: authController.emailObs.value.toString().isNotEmpty
                        ? authController.emailObs.value.toString()
                        : 'Email'
                    ),
                  ],
                ),
              )),
              SizedBox(height: 15,),
              Obx(() => Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                ),
                child: Row(
                  children: [
                    Icon(Icons.phone, color: AppColors.greyColor,)
                   , SizedBox(width: 20,),
                    GreyText(text: authController.phone.value.isNotEmpty
                      ? authController.phone.value
                      : 'Phone'),
                  ],
                ),
              )),
              SizedBox(height: 30,),
              BlackTextWidget(text:
              'Change Password',fontSize:18,fontWeight:
              FontWeight.w600,),
              SizedBox(height: 10,),
              TextFeildWidget(hintext: 'Current password', prefixIcons: Icons.lock_outline, controller: passwordController,color: AppColors.whiteColor),
              PasswordWidget(hintext: 'password', prefixIcons: Icons.lock_outline, controller: checkPasswordController,),
              TextFeildWidget(hintext: 'Confirm password', prefixIcons: Icons.lock_outline, controller: passwordConfirmController,color: AppColors.whiteColor),
              SizedBox(height: 20,),
              GreenTextButton(
                text: 'Save settings',
                ontap: () {
                  authController.changePassword(
                    currentPassword: passwordController.text.trim(),
                    newPassword: checkPasswordController.text.trim(),
                    confirmPassword: passwordConfirmController.text.trim(),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
