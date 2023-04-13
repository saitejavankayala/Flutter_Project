import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/Screen/Auth/signUpScreen.dart';
import 'package:test_project/Screen/Drawer/DrawerScreen.dart';
import 'package:test_project/Screen/User/addUser.dart';
import 'package:test_project/Screen/User/cardItem.dart';
import 'package:get/get.dart';
import 'package:test_project/Controllers/User/user.dart';
class TodoApp extends StatefulWidget {

  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  final UserController userController = Get.put(UserController());

  void deleteItem(int indexValue){
  showDialog(context: context, builder: (_) {
    return AlertDialog(
      title: Text("Are you sure want to delete this ${userController.user[indexValue].firstName} ?"),
      actions: [
        TextButton(onPressed: (){
             Navigator.of(context).pop(false);
        }, child: const Text("Close")),
        TextButton(onPressed: (){
          Navigator.of(context).pop(false);
          userController.delete(indexValue);
        }, child: const Text("Delete"))
      ],
    );
  });
  }
  void editItemFun(int indexValue){
    Get.to(()=>AddUser(checkingUser: indexValue,));
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: DrawerScreen(),
      body: Obx(() => ListView.builder(
            itemCount: userController.user.length,
            itemBuilder: (context,index)=>
                CardItem(user: userController.user[index], editItem: ()=> editItemFun(index), deleteItem: ()=> deleteItem(index))


         ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){Get.to(()=> const AddUser(checkingUser: -1,));
          },
           tooltip: "Increment",
          child: const Icon(Icons.add),),

    );

  }

}


