import 'package:flutter/material.dart';

class TextInputPasswordWidgets extends StatelessWidget {
  final TextEditingController controller;
  final Function validatorFunction;
  final String hintText;
  final bool isHidden;
  final Function isHiddenFunction;

  const TextInputPasswordWidgets({Key? key, required this.controller,required this.isHiddenFunction,
    required this.validatorFunction, required this.hintText, this.isHidden= false  }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return
      Padding(padding: const EdgeInsets.only(left: 30, right: 30,bottom: 20),
          child:

          TextFormField(
            obscureText: isHidden,
            validator: (value){ return validatorFunction(value);},
            controller: controller,
            decoration:  InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                isHidden
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () { isHiddenFunction();
              },
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: hintText,
            ),
            ),
            );
  }
}
