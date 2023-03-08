


import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/single_places/single_place_model.dart';

class SinglePlaceRemote{


  static Future<SinglePlaceModel?> fetchSinglePlace(String id_value) async{

    Response response;
    var dio= Dio();

    response = await dio.post('http://sanatabzar128.ir/v2/singleplaces',
        data: {
          'token': GetStorage().read('mytoken'),
          'page_param': '1',
          'per_param': '10',
          'id_place': id_value});

    try{
      if (response.statusCode == 200) {


        return SinglePlaceModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }
  }
}