



import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class submitFavoriteRemote{

  static Future<bool?> fetchfavorite(String IdValue) async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/submitfavorite',
        data: {
          'token':GetStorage().read('mytoken'),
          'type_fav': 'places',
          'id_value': IdValue,
    });


    try{
      if (response.statusCode == 200) {
        return true;
      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}