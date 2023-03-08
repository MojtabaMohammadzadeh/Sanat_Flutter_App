




import 'dart:convert';




import 'package:dio/dio.dart';

import '../model/phone_entry_model.dart';
import 'package:get/get.dart' hide Response;
class SendPhoneRemote {


  static Future<SendPhoneResponse?> sendPhoneNumber(String phoneNumber) async {

    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/sendcode',data: {'phone_number':phoneNumber,'ios': ''});


  }

}