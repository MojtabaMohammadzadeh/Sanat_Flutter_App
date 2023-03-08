



import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/new_shop_list/New_shop_lists.dart';

class ShopListsRemote{

  static Future<NewShopLists?> getShopList() async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/listplacescategory',
        data: {
      'token':GetStorage().read('mytoken'),
          'device_id': '2cd05a4743776040',
          'page_param': '1',
          'per_param' : '10',
          'type' : 'my',

        });


    try{
      if (response.statusCode == 200) {


        return NewShopLists.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){


      return null;

    }


  }


}