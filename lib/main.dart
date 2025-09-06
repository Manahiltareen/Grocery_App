import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:groceryapp_with_firebase/firebase_options.dart';

import '../../../linker/linker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home :
      //ShippingAddress(),
      //CartScreen(),
      //TrackScreen(),
      //VeryfyNumber(),
      //ExpansionPhoneField (),
      // VerifyNumber(),
     // HomeScreen1(),
      // ForgetpasswordScreen(),
      //ReveiwScreen(),
     // BottomNav(),
      //SplashScreen8(),
      //SplashScreen7(),
      //BottomBar(),
      //BottomAppBar(),
      //CategariesScreen(),
      //FavouriteScreen(),
      // HomeScreen1(),
     LoginScreen(),
     // WelcomeScreen(),
   //HomeScreen(),
      //SplashScreen01(),
     // SignupScreen(),
       //OnBoarding(),
      //SplashScreen6(),
      //SplashScreen5(),
      //SplashScreen4(),
     //SplashScreen3(),
    // SplashScreen2(),
  // SplashScreen(),
    );
  }
}
