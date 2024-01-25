import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/widgets/text_widgets.dart';

import 'box_shadow.dart';
import 'image_widget.dart';

Widget textFormField(
    {
    TextEditingController? controller,
    String text = "",
    String iconName = "",
    String hintText = "Type in your info",
      bool obscureText = false,
    void Function(String value)? func}) {
  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        Container(
          width: 325.w,
          height: 50.h,
          decoration: appBoxTextFormField(),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 17.w),
                  child: appImage(imagePath: iconName)),
              app_textfield_only(controller: controller,hintText: hintText,func: func,obscureText: obscureText)
            ],
          ),
        )
      ],
    ),
  );
}

Widget app_textfield_only({TextEditingController? controller,String hintText = "Type in your info",double width=240,double height=40, void Function(String value)? func,bool obscureText = false,}){
    return  Container(
      width: width.w,
      height: height.h,
      child: TextField(
        controller: controller,
        onChanged: (value)=>func!(value),
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 8.h,left: 10.w),//used to resize our hintText inside the searchBar
            hintText: hintText,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent))),

        maxLines: 1,
        autocorrect: false,
        obscureText: obscureText,
      ),
    );
}
