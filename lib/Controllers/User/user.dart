import 'package:get/get.dart';
import '../../Model/User/User.dart';
class UserController extends GetxController{

  RxList<User> user = <User>[].obs;
  @override

  void delete(int index){
    user.removeAt(index);
  }

}