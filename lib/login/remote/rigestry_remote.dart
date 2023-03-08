


import 'package:dio/dio.dart';
import '../model/rigestry_model.dart';


class RigesterCodeRemote {

  static Future<RigesterCodeModel?> sendRigesterCode(String phoneNumber, String Code) async{
    Response response;
    var dio= Dio();
    String defaultCountryCode = "+98";

    if(phoneNumber.startsWith("0"))
    {
    phoneNumber = phoneNumber.replaceFirst("0", "$defaultCountryCode");
     }

    response = await dio.post('http://sanatabzar128.ir/v2/checkcode',
        data: {
      'code': Code,
      'phone_number': phoneNumber,
      'type_device': 'android',
      'device_id': '""',
      'device_name': '""'});




    try{
      if (response.statusCode == 200) {



        return RigesterCodeModel.fromJson(response.data);

      }

      else {


        return null;
      }
    }catch(e){

      return null;

    }
  }
}