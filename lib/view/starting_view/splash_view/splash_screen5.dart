

import '../../../linker/linker.dart';

class SplashScreen5 extends StatelessWidget {
  const SplashScreen5({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.boyimageplash,fit: BoxFit.cover,),
          SizedBox(height: 250,),
          Padding(
            padding: const EdgeInsets.only(top: 450.0),
            child: Container(
            height:424.6357727050781 ,
            width:414.0995178222656 ,
              color: AppColors.whiteColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(
                  children: [
                    BlackTextWidget(text: " Premium Food\n At Your Doorstep",),
                    SizedBox(height: 10,),
                    GreyText(text: "Lorem ipsum dolor sit amet, consetetu \n sadipscing elitr, sed diam nonumy"),
                    SizedBox(height: 50,),
                    GreenTextButton(text: "Start", ontap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>OnBoarding()));
                    } ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

