






import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/search_model/Search_model.dart';

class SearchRemote{

  static Future<SearchModel?> fetchSearch(String searchType, String Value) async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/finde',
        data: {
      'token':GetStorage().read('mytoken'),
          'value': Value,
          'search_type': searchType,
          'per_param': 10,
          'page_param':1,
        });


    try{
      if (response.statusCode == 200) {
               return SearchModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}