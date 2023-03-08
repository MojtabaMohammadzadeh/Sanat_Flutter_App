




import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class NewAdressRemote{

  static Future<bool?> fetchNewAddress(String PostalCode,String Address) async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/store-address',
        data: {
          'token':GetStorage().read('mytoken'),
          'per_param': '10',
          'page_param': '1',
          'postal_code': PostalCode,
          'address' : Address,


    });



    try{
      if (response.statusCode == 200) {
        print("thisssssssssssssssssssssss issssssssssssssssss adres response");
        print(response.data);
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