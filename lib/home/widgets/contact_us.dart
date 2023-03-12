



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants.dart';
import '../contrroller/single_brand_controller.dart';

class ContactUs extends StatelessWidget {
   ContactUs({Key? key}) : super(key: key);
  SingleBrandController _contactUsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Expanded(child: SizedBox()),
            IconButton(onPressed: ()=>Navigator.of(context).pop(), icon:const Icon(Icons.close,size: 24,)),
            const SizedBox(width: 8,)
          ],
        ),

        const SizedBox(height: 10,),
        Text(_contactUsController.brandName,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
        const SizedBox(height: 8,),
        (_contactUsController.insta.isNotEmpty)?Row(
          children: [
            IconButton(onPressed: () async{

              await Clipboard.setData(ClipboardData(text: _contactUsController.insta.toString()));
            }, icon: const Icon(Icons.copy_outlined)),
            const Expanded(child: SizedBox()),
            Container(
                width: 80.w,
                child: Text(_contactUsController.insta.toString(),
                  style: const TextStyle(fontSize: 13, fontFamily:"DanaFaNum",),
                  maxLines: 8,textAlign:TextAlign.right,textDirection:TextDirection.rtl,)),

            const SizedBox(width: 16,)
          ],
        ):SizedBox(),
        const SizedBox(height: 10,),
        (_contactUsController.phone.isNotEmpty)?Row(
          children: [
            IconButton(onPressed: () async{
              await Clipboard.setData(ClipboardData(text: _contactUsController.phone.toString()));

            }, icon: const Icon(Icons.copy)),
            const Expanded(child: SizedBox()),
            Container(
                width: 80.w,
                child: Text(_contactUsController.phone.toString(),
                  style: const TextStyle(fontSize: 13, fontFamily:"DanaFaNum",),
                  maxLines: 8,textAlign:TextAlign.right,textDirection:TextDirection.rtl,)),

            const SizedBox(width: 16,)
          ],
        ):SizedBox(),

        const SizedBox(height: 8,),

        (_contactUsController.fax.isNotEmpty)?Row(
          children: [
            IconButton(onPressed: () async{

              await Clipboard.setData(ClipboardData(text: _contactUsController.fax.toString()));
            }, icon: const Icon(Icons.copy_outlined)),
            const Expanded(child: SizedBox()),
            Container(
                width: 80.w,
                child: Text(_contactUsController.fax.toString(),
                  style: const TextStyle(fontSize: 13, fontFamily:"DanaFaNum",),
                  maxLines: 8,textAlign:TextAlign.right,textDirection:TextDirection.rtl,)),

            const SizedBox(width: 16,)
          ],
        ):SizedBox(),



        const SizedBox(height: 8,),
        (_contactUsController.sms.isNotEmpty)?Row(
          children: [
            IconButton(onPressed: () async{

              await Clipboard.setData(ClipboardData(text: _contactUsController.sms.toString()));
            }, icon: const Icon(Icons.copy_outlined)),
            const Expanded(child: SizedBox()),
            Container(
                width: 80.w,
                child: Text(_contactUsController.sms.toString(),
                  style: const TextStyle(fontSize: 13, fontFamily:"DanaFaNum",),
                  maxLines: 8,textAlign:TextAlign.right,textDirection:TextDirection.rtl,)),

            const SizedBox(width: 16,)
          ],
        ):SizedBox(),
        const SizedBox(height: 58,),

        const SizedBox(height: 50,),
      ],
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