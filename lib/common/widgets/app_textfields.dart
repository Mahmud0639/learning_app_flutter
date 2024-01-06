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
        text14Normal(text: text),
        Container(
          width: 325.w,
          height: 50.h,
          decoration: appBoxTextFormField(),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 17.w),
                  child: appImage(imagePath: iconName)),
              Container(
                width: 260.w,
                height: 50.h,
                child: TextField(
                  controller: controller,
                  onChanged: (value)=>func!(value),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: hintText,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),

                  maxLines: 1,
                  autocorrect: false,
                  obscureText: obscureText,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
