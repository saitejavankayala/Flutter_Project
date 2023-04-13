
class ValidatorTextInputs {

  bool isNotEmpty({required String value}){
    if(value.isNotEmpty){
      return false;
    }else {
      return true;
    }
  }

  String?  isValidEmail({required String email}) {
    if(isNotEmpty(value: email)){
      return "Email Cannot Be Empty";
    }else {
      final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

      if (!emailRegExp.hasMatch(email)) {
        return "Please Check Email Is Not Valid";
      }
    }
    return null;
  }


  String? isValidName({required String name}){
    if(isNotEmpty(value: name)){
      return "Name Cannot Be Empty";
    }else {
      final nameRegExp = RegExp(r'^[a-zA-Z]+$');
      if (!nameRegExp.hasMatch(name)) {
        return "Please Check Name Is Not Valid";
      }
    }
    return null;
  }
  String? isValidImageUrl({required String url}) {
    if(isNotEmpty(value: url)){
      return "Url Cannot Be Empty";
    }else {
      RegExp regExp = RegExp(
        r"^((http[s]?|ftp):\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$",
        caseSensitive: false,
        multiLine: false,
      );
      if (!regExp.hasMatch(url)){
        return "Url is not valid!!";
      }
    }
    return null;
  }


  String?  isValidPassword({required String password}){
    if(isNotEmpty(value: password)){
      return "Password Cannot Be Empty";
    }else if(password.length <=8){
      return "Password length must be greater than 8";
    }
    return null;
  }
  String?  isValidConfirmPassword({required String password, required String confirmPassword}){
    if(isNotEmpty(value: confirmPassword)){
      return "Password Cannot Be Empty";
    }else if(confirmPassword.length <=8){
      return "Password length must be greater than 8";
    }else if(password != confirmPassword){
      return "Password & Confirm Password are not same!";
    }
    return null;
  }

  String?  isValidPhone({String? number}){
    if (number?.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }

}



