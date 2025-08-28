import 'package:get/get.dart';
import 'package:groceryapp_with_firebase/controller/FirebaseController/auth_controller.dart';

import '../../../linker/linker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  AuthController SignupController = AuthController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
              children: [
                Container(
                  height: 390,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppImages.female2,),fit: BoxFit.cover,),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Image(image: AssetImage(AppIcons.backicon)),
                          SizedBox(width: 100,),
                          Text('Welcome',style: TextStyle(color: Colors.white,
                              fontSize: 18,fontWeight: FontWeight.w500,fontFamily: 'Poppins'),),
                        ],
                      ),
                    ),
                    SizedBox(height: 300,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:AppColors.lightGrey,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15,),
                            BlackTextWidget(text: 'Create account',fontWeight:
                            FontWeight.w600,fontSize: 26,textalignn: TextAlign.start,),
                            BlackTextWidget(text: 'Quickly create account',fontWeight:
                            FontWeight.w400,fontSize: 15,textalignn: TextAlign.start,textColor: AppColors.greyColor,),
                            SizedBox(height: 10,),
                            TextFeildWidget(hintext: 'enter the email',
                              prefixIcons:Icons.email_outlined, controller:emailController,textInputType: TextInputType.emailAddress, color: AppColors.whiteColor),
                           SizedBox(height: 10,),
                            TextFeildWidget(hintext: 'enter the phone number', prefixIcons:Icons.phone,
                              controller:phoneNumberController,textInputType: TextInputType.phone,color: AppColors.whiteColor),
                            SizedBox(height: 10,),
                            PasswordWidget(hintext: 'enter the password', prefixIcons:Icons.lock_outline, controller: passwordController),
          
                            SizedBox(height: 10,),
                            Obx(
                              () {
                                if (SignupController.isloading.value) {
                                  return CircularProgressIndicator();
                                } else {
                                  return GreenTextButton(
                                    text:'Signup',
                                    ontap:(){
                                      SignupController.signup();
                                    },
                                  );
                                }
                              }
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GreyText(text: 'Dont have account?',),
                                SizedBox(width: 10,),
                                InkWell(
                                  onTap: (){
                                    Get.to(() => HomeScreen1());


                                  },
                                  child: BlackTextWidget(text:
                                  'Signin',fontSize: 15,fontWeight: FontWeight.w300,),
                                ),
                                SizedBox(height: 20,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]
          ),
        )
    );
  }
}




