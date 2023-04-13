import 'package:flutter/material.dart';
import 'package:test_project/Controllers/User/form_controller.dart';
import 'package:test_project/Controllers/User/user.dart';
import 'package:get/get.dart';
import 'package:test_project/Screen/User/todo.dart';
import 'package:test_project/Widgets/textInputWidgets.dart';
import 'package:test_project/utilities/validator.dart';
class AddUser extends StatefulWidget {
  const AddUser({Key? key, required this.checkingUser}) : super(key: key);
  final int checkingUser;

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final controller = Get.put(FormController());

  final userController = Get.find<UserController>();
  late final String userTitle;
  late final String buttonTitle;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.checkingUser != -1) {

      controller.createFirstNameController.text = userController.user[widget.checkingUser].firstName;
      controller.createEmailController.text = userController.user[widget.checkingUser].email;
      controller.createLastNameController.text = userController.user[widget.checkingUser].lastName;
      controller.createAvatarUrlController.text = userController.user[widget.checkingUser].avatarUrl;
      userTitle = "Edit User";
      buttonTitle = "Update";
    }else{
      userTitle = "Add User";
      buttonTitle = "Create";
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text(userTitle),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 50),
              child:
            TextInputWidgets(controller: controller.createFirstNameController,
              validatorFunction: (value){
                return ValidatorTextInputs().isValidName(name: value ?? '');
              },
              hintText: "Enter a First Name",),),
            TextInputWidgets(controller: controller.createLastNameController,
              validatorFunction: (value){
                return ValidatorTextInputs().isValidName(name: value ?? '');
              },
              hintText: "Enter a Last Name",),
            TextInputWidgets(controller: controller.createEmailController,
              validatorFunction: (value){
                return ValidatorTextInputs().isValidEmail(email: value ?? '');
              },
              hintText: "Enter Email Address",),
            TextInputWidgets(controller: controller.createAvatarUrlController,
              validatorFunction: (value){return ValidatorTextInputs().isValidImageUrl(url: value ?? '');},
              hintText: "Enter a Avatar URL",),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text('Cancel', style:  TextStyle(fontSize: 20)),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),

                  onPressed:
                () {
                    if(_formKey.currentState!.validate()){
                    if(widget.checkingUser != -1){
                  controller.edit(widget.checkingUser);
                  }
                else{
                  controller.create();}
                }},
                  child: Text(buttonTitle, style:  const TextStyle(fontSize: 20)),
                )

              ],
            ),

          ],
        ),
      ),
    );
  }
}
