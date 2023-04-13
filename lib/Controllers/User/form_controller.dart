
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Controllers/User/user.dart';

import '../../Model/User/User.dart';

class FormController extends GetxController {
  final homeController = Get.find<UserController>();

  final TextEditingController createFirstNameController = TextEditingController();
  final TextEditingController createLastNameController = TextEditingController();
  final TextEditingController createAvatarUrlController = TextEditingController();
  final TextEditingController createEmailController = TextEditingController();

  void create(){
    homeController.user.add(User(avatarUrl: createAvatarUrlController.text, lastName: createLastNameController.text, firstName: createFirstNameController.text, email: createEmailController.text));
    Get.back();
  }
  void edit(int index){
    homeController.user[index].firstName= createFirstNameController.text;
    homeController.user[index].lastName= createLastNameController.text;
    homeController.user[index].avatarUrl= createAvatarUrlController.text;
    homeController.user[index].email= createEmailController.text;
    homeController.user.refresh();
    Get.back();
  }
}