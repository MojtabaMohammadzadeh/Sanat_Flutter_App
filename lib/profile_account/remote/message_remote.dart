



import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/messages/All_messages.dart';

class MessageRemote{

  static Future<AllMessages?> fetchMessage() async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v2/allmessage',
        data: {
      'token':GetStorage().read('mytoken'),
          'device_id': '2cd05a4743776040',
          'per_param' : '1',
          'page_param' : '10',

        });


    try{
      if (response.statusCode == 200) {

        return AllMessages.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }


}