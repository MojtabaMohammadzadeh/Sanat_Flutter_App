




import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/user_profile_model.dart';

class UserRemote{

  static Future<ProfileModel?> fetchUser(String myToken) async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/userprofile',
        data: {
      'token':GetStorage().read('mytoken'),
          });


    try{
      if (response.statusCode == 200) {

        return ProfileModel.fromJson(response.data);

      }

      else  {

        return null;
      }
    }catch(e){

      return null;

    }


  }
}