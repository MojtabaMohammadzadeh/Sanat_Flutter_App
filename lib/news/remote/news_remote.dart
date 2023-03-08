





import 'package:dio/dio.dart';

import '../model/News_model.dart';



class NewsRemote{

  static Future<List<NewsModel>?> fetchNews() async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/news', data: {'page_param': '1','per_param': '10'});



    try{
      if (response.statusCode == 200) {
        
        print("ressssssssssssssssspppppppppppppponseeee");
        print(response.data.map<NewsModel>(NewsModel.fromJson).toList());
        return response.data.map<NewsModel>(NewsModel.fromJson).toList();

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}



