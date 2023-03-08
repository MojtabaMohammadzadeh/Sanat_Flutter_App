




import 'package:dio/dio.dart';

import '../model/all_category_model.dart';

class CategoryRemote{

  static Future<AllCategoryModel?> fetchCategory() async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/allcategoryplaces',
        data: {'page_param': '1', 'per_param': '10',});

    try{
      if (response.statusCode == 200) {


        return AllCategoryModel.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}