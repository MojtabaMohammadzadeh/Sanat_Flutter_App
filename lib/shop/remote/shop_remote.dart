



import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/shop_model.dart';

class ShopRemote{

  static Future<ShopModel?> fetchshop() async{

    List <ShopModel> _list = [];

    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/vip-category',
        data: {
      'token':GetStorage().read('mytoken'),
          'per_param': '10','page_param': '1'});


    try{
      if (response.statusCode == 200) {


        return ShopModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}