




import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/constants.dart';
import '../model/slider_model/slider_model.dart';

class SendImageRemote{





  static Future<SliderModel?> upload(File file) async {
    Response response;
    String? fileName = file.path.split('/').last;


    FormData data = FormData.fromMap({
      "img": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),

      "token" :GetStorage().read('mytoken'),

    });

    Dio dio = Dio();

    response= await dio.post('http://sanatabzar128.ir/v2/uploadsliderplace', data: data);

    try{
      if (response.statusCode == 200) {

        return SliderModel.fromJson(response.data);
      }

      else {


        return null;
      }
    }catch(e){

      return null;

    }

  }


}