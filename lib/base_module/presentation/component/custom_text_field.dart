import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_review/base_module/presentation/core/vaalues/style.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController ? controller;
  final TextStyle ? style;
  final Color ? focusColor;
  final Color ? fillColor;
  final TextStyle ? hintStyle;
  final String ? hintText;
  final Widget ? suffixIcon;
  final Widget ? prefixIcon;
  final int ? maxLines;
  final TextInputType ? keyboardType;
  final String? Function(String?)? validator;

  // final int ? maxLines;

  const CustomTextField({Key? key, this.controller,this.style,this.focusColor,this.fillColor,this.hintStyle, this.hintText,
    this.suffixIcon,this.keyboardType,this.validator, this.prefixIcon,
    this.maxLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      // Container(
      //
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(15),
      //   color: CommonColors.colorWhite,
      //
      // ),
      // // height: 80,
      // // margin: EdgeInsets.all(10),
      // child:
      TextFormField(



        maxLines: maxLines,
        validator: validator,
        // initialValue: 'g',

        cursorColor: CommonColors.colorGreen,
        keyboardType: keyboardType,
        controller: controller,
        style: style,
        //decoration property
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: CommonColors.scaffoloBgColor,
              width: 1.5,
            ),
          ),
          filled: false,
          isDense: true,
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.symmetric(vertical: 21,horizontal: 10 ),

          suffixIcon:suffixIcon,
          focusColor: focusColor,
          // hintText: "Email/Mobile",
          fillColor: fillColor,

          // errorText: "Please enter a valid email",
          hintText: hintText,
          //make hint text
          hintStyle: hintStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: CommonColors.colorGreen, width: 1.5),
            borderRadius: BorderRadius.circular(15.0),
          ),


          // ),
        ),
      // ),
    );
  }
}



