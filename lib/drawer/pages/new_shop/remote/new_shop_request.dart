


import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/New_shop_model.dart';

class NewShopRequest{


  static Future<NewShopModel?> getNewShop(String idvision, String title, String parent_id) async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/newplace',
        data: {
      'token':GetStorage().read('mytoken'),
           'device_id': '2cd05a4743776040',
          'id_division': idvision,
            'title' : title,
          'parent_id' : parent_id,

        });


    try{
      if (response.statusCode == 200) {


        return NewShopModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){


      return null;

    }


  }


}