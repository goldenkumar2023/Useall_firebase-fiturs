import 'package:flutter/material.dart';
class AppWidgets{
  Widget editText(String hint, TextEditingController controller){
    return Padding(
      padding:  EdgeInsets.only(top: 15, right: 15, left: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

}