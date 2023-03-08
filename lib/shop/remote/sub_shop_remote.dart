




import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/subpage_shop/sub_page_shop_model.dart';

class SubShopRemote{


  static Future<SubPageShopModel?> fetchSubShop(String id_category) async{
    Response response;
    var dio= Dio();

    response = await dio.post('http://sanatabzar128.ir/v2/get-vip-product-with-subcategory',
        data: {
          'token':GetStorage().read('mytoken'),
          'vip_category_id': id_category,});

    try{
      if (response.statusCode == 200) {


        return SubPageShopModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }

  }
}
