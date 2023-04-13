import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Screen/Auth/loginScreen.dart';
import 'package:test_project/Screen/Auth/signUpScreen.dart';
import 'package:test_project/utilities/Strings.dart';
class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(StringConstant.helloThere,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20,bottom: 50),
              child: Text(StringConstant.landingScreenDesc,style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Image.asset('assets/images/computer.png'),
            ),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width - 80,
              child: ElevatedButton(onPressed: () async {
                  Get.to(()=>const LoginScreen());
              },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    backgroundColor: Colors.blue[700],
                  ),
                  child: const Text(StringConstant.login)),
            ),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width - 80,
              child: ElevatedButton(onPressed: () async {
                    Get.to(()=>const SignUpScreen());
              },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    backgroundColor: Colors.red[700],
                  ),
                  child: const Text(StringConstant.signUp)),
            ),

          ],
        ),
      ),
    );
  }
}
