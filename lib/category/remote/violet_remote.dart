



import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class VioletRemote{

  static Future<bool?> fetchviolet(String productId) async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/vip-product-single-alert',
        data: {'token':GetStorage().read('mytoken'),
          'vip_product_id': productId});


    try{
      if (response.statusCode == 200) {


        return true;

      }

      else  {


        return false;
      }
    }catch(e){

      return null;

    }


  }
}