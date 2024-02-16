import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';

Widget text24Normal(
    {String text = "",
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 24, fontWeight: fontWeight, color: color),
  );
}

/*Widget text16Normal(
    {String text = "", Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: color),
  );
}*/

class Text16Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const Text16Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primarySecondaryElementText,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(fontSize: 16, fontWeight: fontWeight, color: color),
    );
  }
}

class Text13Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const Text13Normal(
      {super.key,
        this.text = "",
        this.color = AppColors.primaryText,
        this.fontWeight = FontWeight.bold,
        this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(fontSize: 13.sp, fontWeight: fontWeight, color: color),
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;

  const Text10Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primarySecondaryElementText,
      this.fontWeight = FontWeight.normal,
      this.textOverflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      overflow: textOverflow,
      maxLines: 1,
      style: TextStyle(fontSize: 10.sp, fontWeight: fontWeight, color: color),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const Text11Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primaryElementText,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 11.sp, fontWeight: fontWeight, color: color),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight? fontWeight;

  const Text14Normal(
      {super.key,
      this.text = "",
      this.color = AppColors.primaryThreeElementText,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          fontSize: 14.sp, fontWeight: fontWeight, color: color),
    );
    ;
  }
}

/*Widget text14Normal(
    {String text = "", Color color = AppColors.primaryThreeElementText}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style:
        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, color: color),
  );
}*/

Widget textUnderline({String text = "Forgot Password"}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12.sp,
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText),
    ),
  );
}

class FadeText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;

  const FadeText(
      {super.key,
      this.text = "",
      this.color = AppColors.primaryElementText,
      this.fontWeight = FontWeight.bold,
      this.fontSize = 10});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.fade,
      style: TextStyle(
          fontSize: fontSize.sp, fontWeight: fontWeight, color: color),
    );
  }
}
