



import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants.dart';
import '../model/shop_sliders.dart';

class ShopImageSlider extends StatelessWidget {
  List <ShopSliders> slidersData;
  ShopImageSlider({Key? key,required this.slidersData} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(

      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 0.9,
        aspectRatio: 2.0,
        initialPage: 2,
        enableInfiniteScroll: true,
      ),
      itemCount: slidersData.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          GestureDetector(
            onTap: ()=>_showModalDialog(context,slidersData[itemIndex].img ?? ""),
            child: Container(

              width: 85.w,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(25),
                image:  DecorationImage(
                  // image: NetworkImage('${Constants.baseUrl}${slidersData[itemIndex].img}' ?? '') ,
                  image: NetworkImage(slidersData[itemIndex].img ?? ""),
                  fit: BoxFit.fitWidth,
                ),
              ),

            ),
          ),
    );
  }
}

_showModalDialog(context,String img){
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.0),
          child: Container(

            constraints: BoxConstraints(
              maxHeight: 40.h,
              maxWidth: 100.w,
            ),
            decoration: BoxDecoration(
              color: lightGrayColor,
              borderRadius: BorderRadius.circular(15),

              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.fill,
              ),
            ),

          ),
        );
      });
}