
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../login/presentation/phone_entry.dart';
import '../../main_nav_page/presentation/main_nav_page.dart';
import '../splash_controller/splash_controller.dart';



class SplashScreen extends StatelessWidget {
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());


  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    //Simulate other services for 3 seconds
    await Future.delayed(Duration(seconds: 5));
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError)
            return errorView(snapshot);
          else
            return OnBoard();
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(
        body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        body: FadeSplashWidget());
  }
}



class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? MainNavPage() : PhoneEntry();
    });
  }

}


// **************************Fade Widget**********************

class FadeSplashWidget extends StatefulWidget {


  @override
  State<FadeSplashWidget> createState() => _FadeSplashWidgetState();
}

class _FadeSplashWidgetState extends State<FadeSplashWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =  AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff29A99B),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
                opacity:_animationController,
                child: Container(
                  width:50.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/img/Logo.png"),
                        fit: BoxFit.fitWidth,
                      )
                  ),
                ),
            ),
            FadeTransition(opacity: _animationController,
            child: Text("تسسسسست",style:TextStyle(fontSize: 24, color:Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
