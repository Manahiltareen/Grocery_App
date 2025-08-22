
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../linker/linker.dart';




class AuthController extends GetxController{
  RxBool isloading = false.obs;
  TextEditingController email= TextEditingController();
  TextEditingController email2= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController password2= TextEditingController();

  void Signup() async {

    try{
      isloading.value = true;
      await FirebaseAuth.instace.createUserWithEmailAndPassword(
        email : email.text, password: password.text,
      ).then((OnValue){

        Get.snackbar("Great", "Account Created sucessfully",
            backgroundColor: Colors.green,icon: Icon(Icons.done_outline_sharp,color: Colors.green.shade900,size: 22,));
        Navigator.push(context, MaterialPageRoute(builder:
            (context)=>HomeScreen()));
    });

    }
    catch(error){
      isloading.value = false;

    Get.snackbar("Oops", "You got an error",
       backgroundColor: Colors.red, icon : Icon(Icons.delete, color:Colors.red.shade900 , size:22, ));
    }
    finally{
      isloading = true;
    }
  }

void Signin ()async{
    try{
      isloading.value = true;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email2.text;
        password: password2.text;
      ).then((OnValue){
        Get.snackbar("great", "you have done it",
            backgroundColor: Colors.green,icon: Icon(Icons.done_outline_sharp,color: Colors.green.shade900,size: 22,)
        );
        Navigator.push(context, MaterialPageRoute(builder:
            (context)=>HomeScreen()));
      });

    }
    catch(e){
      isloading.value = false;
      Get.snackbar("Oops", "You got an error",
          backgroundColor: Colors.red, icon : Icon(Icons.delete, color:Colors.red.shade900 , size:22, ));
    }
    finally{
      isloading.value = false;

    }
}




}