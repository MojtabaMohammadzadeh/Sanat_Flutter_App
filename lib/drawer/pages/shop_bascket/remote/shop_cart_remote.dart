




import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../model/cart_items/Cart_items.dart';
import '../model/cart_items/ShopCart.dart';



class ShopCartRemote{

  static Future<CartItems?> fetchshopCart() async{



    Response response;
    var dio= Dio();
    response = await dio.post('http://sanatabzar128.ir/v1/shop/get-cart-items',
        data: {
      'token':GetStorage().read('mytoken'),
          'per_param': '10',
          'page_param': '1'});



    try{
      if (response.statusCode == 200) {




        return CartItems.fromJson(response.data);

      }

      else  {


        return null;
      }
    }catch(e){

      return null;

    }


  }
}