import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
   AppTextFormField({super.key,
  this.controller,
  this.type,
  this.onSubmit,
  this.onChange,
  this.onTap,
  this.isPassword = false,
  this.validate,
  this.label,
  this.hintText,
  this.prefix,
  this.suffix,
  this.suffixPressed,
  this.isClickable = true,
  });

  TextEditingController? controller;
  TextInputType? type;
  var onSubmit;
  var onChange;
  var onTap;
  bool isPassword = false;
  var validate;
  String? label;
  String? hintText;
  IconData? prefix;
  IconData? suffix;
  var suffixPressed;
  bool isClickable;


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      cursorColor: Colors.green,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.green, fontSize: 15),
        focusColor: Colors.greenAccent,
        floatingLabelStyle: TextStyle(color: Colors.green),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 5, //<-- SEE HERE
              color: Colors.greenAccent,
            ),
            borderRadius: BorderRadius.circular(25.0)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3, //<-- SEE HERE
            color: Colors.greenAccent,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: hintText,
        labelText: label,
        labelStyle:  TextStyle(color: Colors.green),
        prefixIcon: Icon(
          prefix,
        ),
        prefixIconColor: Colors.greenAccent,
        suffixIcon: suffix != null ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,

          ),
        ) : null,
        suffixIconColor: Colors.greenAccent,
      ),
      style: TextStyle(color: Colors.green),

    );
  }
}

