


import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/single_brand/last_price_single_brand.dart';
import '../model/single_brand/list_category.dart';
import '../model/single_brand/products.dart';
import '../model/single_brand/slider_single_brand.dart';

import '../model/singlebrand_last_price/LastPrice.dart';

import '../remote/single_brand_remote.dart';

class SingleBrandController extends GetxController{

  var isLoading = true.obs;
  var controllCategoryList = <ListCategory> [];
  var controllProductsList = <Products> [];
  // var controllLastPrice = <LastPriceSingleBrand>[];
  var controllSlider = <SliderSngleBrand>[];
  var singleLastPrice = <LastPrice>[];
  var brandName = '';
  var CountShow = 0;
  var aboutDisc = '';
  var phone = '';
  var insta = '';
  var fax = '';
  var sms = '';

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //
  //   getSingleBrand();
  //
  //   super.onInit();
  // }

  void getSingleBrand(String? brand_id) async{
    isLoading(true);
    brandName = '';
    update();
    String brandId = brand_id?? '10';
    try{

      var singleBrand = await SingleBrandRemote.fetchSingleBrand(brandId);

      if (singleBrand != null){

        CountShow = singleBrand.singleBrand?.countShow ??0;
        brandName = singleBrand.singleBrand?.name ?? "";
        aboutDisc = singleBrand.about?.body ?? "";
        phone = singleBrand.contact?.phone ?? "";
        insta = singleBrand.contact?.insta ?? "";
        fax = singleBrand.contact?.fax ?? "";
        sms = singleBrand.contact?.sms ?? "";

        singleBrand.slider?.forEach((element) {
          controllSlider.add(element);
          update();
        });

        isLoading(false);
        singleBrand.listCategory?.forEach((element) {
          if(element.products.isNotEmpty){
            controllCategoryList.add(element);
            update();
          }
        });




      }
      // var BlastPrice = await SingleBrandRemote.fetchSingleBrandlastPrice(brandId);
      //
      // if(BlastPrice?.lastPrice != null){
      //   BlastPrice?.lastPrice?.forEach((element) {
      //     singleLastPrice.add(element);
      //     update();
      //   });
      // }

    }finally{
      isLoading(false);
    }
  }


}