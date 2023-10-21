import 'package:flutter/material.dart';
import '../const.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key, required this.hitText, this.maxLine = 1, this.onSaved, this.onChanged});

  final String hitText;
  final int maxLine;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onSaved: onSaved,
        onChanged:onChanged ,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'field is  required';
          } else {
            return null;
          }
        },
        cursorColor: kPrimaryColor,
        maxLines: maxLine,
        decoration: InputDecoration(
            hintText: hitText,
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(kPrimaryColor)));
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color ?? Colors.white),
  );
}
//    OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color:color??Colors.white)
//       ));
