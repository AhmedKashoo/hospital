import 'package:flutter/material.dart';

Widget form({
  required TextEditingController controlled_text,
  required String text,
   var validator,
  var tap ,
  var prefix_icon,
  var suffix_icon ,
  var visible_function,
  var color,
  var fontcolor,
  bool obscureText = false,
  required TextInputType input_type,
})=>TextFormField(
  onTap: tap,
  validator: validator,
  obscureText: obscureText,
  keyboardType: input_type,
  controller: controlled_text,
  decoration: InputDecoration(
    labelStyle: TextStyle(
      color: fontcolor
    ),
    fillColor: color,
    filled: true,
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
Widget chatting()=>Container(

  height: 80,

  decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(15),

    color: Colors.white

  ),

  child:   Row(

    children: [

      Padding(
        padding: const EdgeInsets.all(18.0),
        child:
            CircleAvatar(

              radius: 25,

              child: Image.asset('image/logo2.png'),

            ),
      ),

      SizedBox(width: 8,),

      Expanded(

        child: Padding(
          padding: const EdgeInsets.only(bottom: 22 ),
          child: Column(

            crossAxisAlignment:CrossAxisAlignment.start ,
            mainAxisAlignment: MainAxisAlignment.end,

            children: [

              Text('Dr.Ba7R',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)
                ,maxLines: 1,overflow: TextOverflow.ellipsis,),
              Text('Hello My name is Ba7r',maxLines: 2,overflow: TextOverflow.ellipsis),



            ],

          ),
        ),


      ),
      Row(
        children: [
          SizedBox(width: 10,),
          IconButton(onPressed: (){},
              icon: Icon(Icons.message)
          )
        ],

      ),

    ],

  ),

);

