import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/utils/image_res.dart';

/*Widget appImage({String imagePath = ImageRes.defaultImage,double width = 16, double height = 16}){
  return Image.asset(imagePath.isEmpty?ImageRes.defaultImage:imagePath,width: width.w,height: height.h);
}*/
//instead of using the Widget directly we can convert it with class type and so it will require less resources
class AppImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  const AppImage({super.key,this.imagePath=ImageRes.defaultImage,this.width=16,this.height=16});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath.isEmpty?ImageRes.defaultImage:imagePath,width: width.w,height: height.h);
  }
}


Widget appImageWithColor({String imgPath = ImageRes.defaultImage,double width = 15,double height = 15,Color color = AppColors.primaryElement}){
  return Image.asset(imgPath.isEmpty?ImageRes.defaultImage:imgPath,width: width,height: height,color: color,);
}
BoxDecoration networkImageDecoration({required String imagePath}){
  return BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
              imagePath
          )
      )
  );
}