




import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/single_product_shop/Single_shop_products.dart';

class SingleProShopRemote{

  static Future<SingleShopProducts?> fetchshopPro(String productId) async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/vip-product-single',
        data: {
          'token':GetStorage().read('mytoken'),
          'vip_product_id': productId,

        });


    try{
      if (response.statusCode == 200) {


        return SingleShopProducts.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}