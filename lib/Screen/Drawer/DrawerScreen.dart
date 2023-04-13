import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Screen/User/todo.dart';
import 'package:test_project/utilities/shared_pref.dart';

import '../Auth/landingScreen.dart';
class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final String email = SharedPrefs().userEmail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  void logOut(){
    showDialog(context: context, builder: (_) {
      return AlertDialog(
        title: const Text("Are you sure want to logout  ?"),
        actions: [
          TextButton(onPressed: (){

            Get.back();
            Get.back();
          }, child: const Text("Close")),
          TextButton(onPressed: (){
            Get.back();
            SharedPrefs().userLoginIn = false;
            Get.to(()=>const LandingScreen());
          }, child: const Text("Logout"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
      children:  [
          DrawerHeader(
            decoration: const BoxDecoration(
            color: Colors.blue,
            ),
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              accountName: Text(
                email,
                style: const TextStyle(fontSize: 18),
              ),
              currentAccountPictureSize: const Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 165, 255, 137),
                child: Text(
                  email[0].toUpperCase(),
                  style: const TextStyle(fontSize: 30.0, color: Colors.blue),
                ), //Text
              ), accountEmail: null, //circleAvatar
            ),
            ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Get.to(()=>const TodoApp());
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            logOut();
          },
        ),
            ],
            ),
    );
  }
}
