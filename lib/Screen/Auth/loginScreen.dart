
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:test_project/Screen/Auth//signUpScreen.dart';
import 'package:test_project/Screen/User/todo.dart';
import 'package:test_project/Widgets/textInputPasswordWidgets.dart';
import 'package:test_project/Widgets/textInputWidgets.dart';
import 'package:test_project/utilities/Strings.dart';
import 'package:test_project/utilities/config.dart';
import 'package:test_project/utilities/shared_pref.dart';
import 'package:test_project/utilities/validator.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(StringConstant.login, style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            ),

            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text(StringConstant.loginScreenDesc, style: TextStyle(fontSize: 16),),
            ),

            TextInputWidgets(controller: emailController, validatorFunction: (value){
            return ValidatorTextInputs().isValidEmail(email: value ?? '');
            },hintText: StringConstant.inputEmailPlaceholder),

            TextInputPasswordWidgets(controller: passwordController,
                isHidden:isPasswordHidden,
                isHiddenFunction: (){
                  setState(() {
                    isPasswordHidden = !isPasswordHidden;
                  });
                },
                validatorFunction: (value){
              return ValidatorTextInputs().isValidPassword(password: value ?? '');
            },hintText: StringConstant.inputPasswordPlaceholder),

            const SizedBox(height: 30),

            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width - 80,
              child: ElevatedButton(onPressed: () async {

                if(_formKey.currentState!.validate()){
                     var response = await http.post( Uri.parse('${Config.url}/login'),body:
                     json.encode({StringConstant.email: emailController.text,StringConstant.password: passwordController.text}),
                       headers: {'Content-Type': 'application/json'},
                     );
                     if(response.statusCode == 200){
                       SharedPrefs().userEmail = emailController.text;
                       SharedPrefs().userLoginIn = true;
                       Get.to(const TodoApp());
                     }else{
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                         content: Text(jsonDecode(response.body)['error']),
                         duration: const Duration(seconds: 2),
                       ));
                     }
                }
              },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    backgroundColor: Colors.blue[700],
                  ),
                  child: const Text(StringConstant.login)),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(StringConstant.donotHaveAnAccount),
                TextButton(onPressed: (){
                     Get.to(()=>const SignUpScreen());
                }, child: const Text(StringConstant.signUp, style: TextStyle(fontSize: 20,color: Colors.black),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
