import 'package:groceryapp_with_firebase/view/starting_view/splash_view/splash_screen5.dart';

import '../../../linker/linker.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 6),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SplashScreen5()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/splash.png',),fit: BoxFit.cover),
          ),
          child: Column(
            children: [SizedBox(height:80,width: 247,),
              BlackTextWidget(text: "Get Discounts \n On All Products",),
              GreyText(text: "Lorem ipsum dolor sit amet, consetetur \n sadipscing elitr, sed diam nonumy"),
              Spacer(),
              GreenTextButton(text: "Get started", ontap: (){}),
              SizedBox(height: 40,)
            ],
          ),
        ),
    );
  }
}

