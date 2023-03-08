



import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/address_model/Address_model.dart';

class AdressRemote{

  static Future<AddressModel?> fetchAddress() async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/addresses',
        data: {
      'token':GetStorage().read('mytoken'),
          'per_param': '10',
          'page_param': '1'});



    try{
      if (response.statusCode == 201) {




        return AddressModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){


      return null;

    }


  }


  static Future<bool?> deletAddress(String addressId) async{
    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/delete-address',
        data: {'token':GetStorage().read('mytoken'),
          'per_param': '10',
          'page_param': '1',
          'address_id' : addressId,
        });

    try{
      if (response.statusCode == 200) {
        return true;
      }

      else  {
        print('heeeeeeeeeeeeeeeeeeeelppppp');
        return null;
      }
    }catch(e){
      print('hooooooooooooooooooooooooooooo');
      print(e);
      return null;

    }
  }
}