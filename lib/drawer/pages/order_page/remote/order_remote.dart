




import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/Ordersmodel.dart';


class OrderRemote{

  static Future<Ordersmodel?> fetchOrder() async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/orders',
        data: {
          'token':GetStorage().read('mytoken'),

          'page_param': '1',
          'per_param': '10',
        });


    try{
      if (response.statusCode == 201) {
        return Ordersmodel.fromJson(response.data);
      }

      else  {

        return null;
      }
    }catch(e){

      return null;
    }


  }
}