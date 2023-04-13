import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_project/Screen/Auth/landingScreen.dart';
import 'package:test_project/Screen/Auth/loginScreen.dart';
import 'package:test_project/Screen/User/todo.dart';
import 'package:test_project/utilities/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    islogin();
  }
   void islogin() async {

        Timer(const Duration(seconds: 5), ()=>{
          if(SharedPrefs().userLoginIn){
            Navigator.pushReplacement(context,

                MaterialPageRoute(builder:
                    (context) => const TodoApp()
                )
            )
          }else{
            Navigator.pushReplacement(context,

                MaterialPageRoute(builder:
                    (context) => const LandingScreen()
                )
            )
          }

        });


  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

