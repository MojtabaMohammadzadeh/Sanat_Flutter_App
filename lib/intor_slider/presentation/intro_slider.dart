
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:splash_screen/login/presentation/phone_entry.dart';

class IntroSliderPage extends StatefulWidget {


  @override
  State<IntroSliderPage> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSliderPage> {
  List<ContentConfig> slides = [];

  @override
  void initState() {

    super.initState();
    slides.add(new ContentConfig(
      title: "Helloooo!",
      description: "this is first slide",
      pathImage: "assets/intro_slider/intro1.jpg"
    ));
    slides.add(new ContentConfig(
        title: "Hiiiiiiiii!",
        description: "this is second slide",
        pathImage: "assets/intro_slider/intro2.png"
    ));

    slides.add(new ContentConfig(
        title: "Hooooooooo!",
        description: "this is thirde slide",
        pathImage: "assets/intro_slider/intro3.jpeg"
    ));

  }

  List<Widget> renderListCustomTabs(){
    List<Widget> tabs = [];
    for(int i= 0; i< slides.length; i++){
      ContentConfig currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(top: 160, bottom: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100.w,
                height: 50.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(currentSlide.pathImage??""),
                  ),
                ),
              ),
              Text(currentSlide.title??""),
              Text(currentSlide.description??""),
            ],
          ),
        ),
      )

      );
    }
    return tabs;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        listCustomTabs: this.renderListCustomTabs(),
        backgroundColorAllTabs: Color(0xffF5F5F5),
        renderSkipBtn: Text(""),
        renderNextBtn: Text(""),
        renderPrevBtn: Text(""),
        onDonePress: (){
          Get.off(PhoneEntry());
        },
      ),
    );
  }
}
