






import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:splash_screen/core/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("تماس با ما"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(

            children: [
              SizedBox(height: 16,),
              Container(
                width: 100.w,
                height: 30.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/contact_us.png'),
                        fit: BoxFit.fitHeight
                    )
                ),
              ),
              SizedBox(height: 32,),
              GestureDetector(
                onTap: (){
                  _makingPhoneCall('tel://+985136914166');
                },
                child: Container(
                  width: 100.w,
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Center(
                    child: Text("شماره تماس ثابت: 05136914166",
                      style: TextStyle(fontSize: 14,fontFamily:'DanaFaNum', fontWeight:FontWeight.w700),
                      textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
                  ),
                ),
              ),
              Divider(height: 2,),
              GestureDetector(
                onTap: (){
                  _makingPhoneCall('tel://+989395100617');
                },
                child: Container(
                  color: grayWhiteColor,
                  width: 100.w,
                  height: 10.h,
                  margin: EdgeInsets.symmetric( vertical: 8),
                  child: Center(
                    child: Text("شماره تماس همراه: 09395100617",
                      style: TextStyle(fontSize: 14,fontFamily:'DanaFaNum', fontWeight:FontWeight.w700),
                      textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async{
                  final uri = Uri.parse('https://rubika.ir/abzarsanat128');
                  if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                  } else {
                  throw 'خطایی به وجود آمده است';
                  }
                },
                child: Container(
                  width: 100.w,
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Center(
                    child: Text("آیدی روبیکا: abzarsanat128",
                      style: TextStyle(fontSize: 14,fontFamily:'DanaFaNum', fontWeight:FontWeight.w700),
                      textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async{
                  final uri = Uri.parse('https://t.me/abzarsanat128');
                  if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                  } else {
                  throw 'خطایی به وجود آمده است';
                  }
                },
                child: Container(
                  color: grayWhiteColor,
                  width: 100.w,
                  height: 10.h,
                  margin: EdgeInsets.symmetric( vertical: 8),
                  child: Center(
                    child: Text("آیدی تلگرام: abzarsanat128",
                      style: TextStyle(fontSize: 14,fontFamily:'DanaFaNum', fontWeight:FontWeight.w700),
                      textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


_makingPhoneCall(String tel) async {
  var url = Uri.parse(tel);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'امکان برقراری تماس وجود ندارد!';
  }
}