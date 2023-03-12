



import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:splash_screen/core/constants.dart';

class ImageMaximize extends StatelessWidget {
  final String img;
  const ImageMaximize({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primaryColor,
      ),

      body: Center(
        child: Container(

          width: 100.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: lightGrayColor,


            image: DecorationImage(
              image: NetworkImage(img),
              fit: BoxFit.fill,
            ),
          ),

        ),
      ),
    );
  }
}
