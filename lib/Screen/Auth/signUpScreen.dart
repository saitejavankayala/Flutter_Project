
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:test_project/Screen/Auth//loginScreen.dart';
import 'package:test_project/Widgets/textInputPasswordWidgets.dart';
import 'package:test_project/Widgets/textInputWidgets.dart';
import 'package:test_project/utilities/Strings.dart';
import 'package:test_project/utilities/validator.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(StringConstant.signUp, style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text(StringConstant.createAnAccountItsFree, style: TextStyle(fontSize: 16),),
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
            TextInputPasswordWidgets(controller: confirmPasswordController,
                isHidden:isConfirmPasswordHidden,
                isHiddenFunction: (){
                  setState(() {
                    isConfirmPasswordHidden = !isConfirmPasswordHidden;
                  });
                },
                validatorFunction: (value){
                  return ValidatorTextInputs().isValidConfirmPassword(password: passwordController.text, confirmPassword: value ?? '');
                },hintText: StringConstant.enterConfirmPassword),
            const SizedBox(height: 30),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width - 80,
              child: ElevatedButton(onPressed: () async {

                if(_formKey.currentState!.validate()){
                     var response = await http.post( Uri.parse('https://reqres.in/api/register'),body:
                     json.encode({StringConstant.email: emailController.text, StringConstant.password: passwordController.text}),
                       headers: {'Content-Type': 'application/json'},
                     );
                     if(response.statusCode == 200){
                      Get.to(()=>const LoginScreen());
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
                    backgroundColor: Colors.red[700],
                  ),
                  child: const Text(StringConstant.signUp)),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text("Already have an account?"),
                TextButton(onPressed: (){
                   Get.to(()=>const LoginScreen());
                }, child: const Text("Login", style: TextStyle(fontSize: 20,color: Colors.black),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
