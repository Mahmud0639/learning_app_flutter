import 'package:flutter/material.dart';
import 'package:shop_app_flutter_udemy/common/widgets/text_widgets.dart';

import '../utils/app_colors.dart';

AppBar buildAppBar({String text = "Login"}){
  return AppBar(
    title: Text16Normal(text: text,color: AppColors.primaryText),
    bottom: PreferredSize(
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,//this is the height of the container
      ),
      preferredSize: Size.fromHeight(1),//this is the space from the main appbar
    ),
  );
}