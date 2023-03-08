




import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants.dart';
import '../model/single_brand/slider_single_brand.dart';
import '../subpages/products.dart';

class SingleImageSlider extends StatelessWidget {
  List <SliderSngleBrand> slidersData;
  SingleImageSlider({Key? key,required this.slidersData} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(

      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1.0,
        aspectRatio: 1.6,
        initialPage: 2,
        enableInfiniteScroll: true,
      ),
      itemCount: slidersData.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          GestureDetector(
            onTap: ()=>_showModalDialog(context,slidersData[itemIndex].img ?? ""),
            child: Container(

              margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
              height: 30.h,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(12),
                image:  DecorationImage(
                  // image: NetworkImage('${Constants.baseUrl}${slidersData[itemIndex].img}' ?? '') ,
                  image: NetworkImage(slidersData[itemIndex].img ?? ""),
                  fit: BoxFit.fill,
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