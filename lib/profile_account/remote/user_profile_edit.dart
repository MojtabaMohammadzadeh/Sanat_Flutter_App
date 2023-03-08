




import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:splash_screen/core/constants.dart';

import '../model/user_edit/User_edit_model.dart';

class UpdateUser{

  static Future<UserEditModel?> fetchUser(String Name, String Family) async{
    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/updateuser',
        data: {
      'token':GetStorage().read('mytoken'),
          'name' : Name,
          'family' : Family,
        });

    try{
      if (response.statusCode == 200) {
        return UserEditModel.fromJson(response.data);
      }
      else  {

        return null;
      }
    }catch(e){

      return null;
    }
  }





}