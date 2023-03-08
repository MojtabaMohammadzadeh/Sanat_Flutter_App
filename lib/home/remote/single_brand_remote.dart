



import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/single_brand/single_brand_model.dart';
import '../model/singlebrand_last_price/Single_brand_last_price.dart';

class SingleBrandRemote {

  static Future<SingleBrandModel?> fetchSingleBrand(String idBrand) async{
    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/singlebrand',
        data: {
      'token': GetStorage().read('mytoken'),
          'page_param': '1',
        'per_param': '10',
          'id_brand': idBrand});

    try{
      if (response.statusCode == 200) {


        return SingleBrandModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }
  }


  static Future<SingleBrandLastPrice?> fetchSingleBrandlastPrice(String idBrand) async{
    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/last-price',
        data: {

          'id_brand': idBrand});

    try{
      if (response.statusCode == 200) {


        return SingleBrandLastPrice.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }
  }
}
