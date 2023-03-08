






import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/Favorite_model.dart';

class FavoriteRemote{

  static Future<FavoriteModel?> fetchfavorite() async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/allfovarite',
        data: {
          'token':GetStorage().read('mytoken'),
          'type_fav': 'places',
          'page_param': '1',
          'per_param': '10',
          });



    try{
      if (response.statusCode == 200) {


        return FavoriteModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }

  static Future<bool?> removefavorite(String IdFavorite) async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/removefavorite',
        data: {
          'token':GetStorage().read('mytoken'),
          'id_favorite': IdFavorite,

        });



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