import '../../../linker/linker.dart';

class ForgetpasswordScreen extends StatefulWidget {
  const ForgetpasswordScreen({super.key});

  @override
  State<ForgetpasswordScreen> createState() => _ForgetpasswordScreenState();
}

class _ForgetpasswordScreenState extends State<ForgetpasswordScreen> {
  TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: BlackTextWidget(text: 'Password Recovery',fontWeight: FontWeight.w500,fontSize: 18,),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Image(image: AssetImage(AppIcons.backicon),color: AppColors.blackColor,)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80,),
        BlackTextWidget(text: 'Forgot Password',fontSize: 25,),
          SizedBox(height: 5,),
          GreyText(text: 'Lorem ipsum dolor sit amet, consetetur \n sadipscing elitr, sed diam nonumy'),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: TextFeildWidget(hintext: 'Email Address',textInputType: TextInputType.emailAddress,
                prefixIcons:Icons.email_outlined, controller: emailController, color: AppColors.whiteColor),
          ),
          SizedBox(height: 20,),
          GreenTextButton(text: "Send link", ontap:(
              ){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>VeryfyNumber()));

          })
        ],
      ),
    );
  }
}
