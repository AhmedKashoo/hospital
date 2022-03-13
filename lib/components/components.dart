import 'package:flutter/material.dart';

Widget form({
  required TextEditingController controlled_text,
  required String text,
   var validator,
  var tap ,
  var prefix_icon,
  var suffix_icon ,
  var visible_function,
  bool obscureText = false,
  required TextInputType input_type,
})=>TextFormField(
  onTap: tap,
  validator: validator,
  obscureText: obscureText,
  keyboardType: input_type,
  controller: controlled_text,
  decoration: InputDecoration(
    labelText:text,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    prefixIcon: Icon(prefix_icon),
    suffixIcon: suffix_icon != null ?  IconButton(onPressed: visible_function,
      icon: Icon(suffix_icon),) :null,
  ),);

Widget button ({
  double width = double.infinity,
  bool isupper = true,
  Color color = Colors.blue,
  required String text,
  required var function,
})=>Container(
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(10)
  ),
  width: width,
  child: MaterialButton(
    onPressed: function,
    child:
    Text(
      isupper ? text.toUpperCase() : text ,
      style:
      TextStyle(color: Colors.white
      ),
    ),
  ),
);
