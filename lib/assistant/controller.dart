import 'package:e_commerce_flutter/assistant/load_all_api_data.dart';
import 'package:e_commerce_flutter/modal/get_all_category_list.dart';
import 'package:e_commerce_flutter/modal/get_all_product_list.dart';
import 'package:e_commerce_flutter/modal/get_all_slider_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var loadingCategoryList = true.obs;
//    TASK TO COMPLETE THE OTHER FIVE CLASS
  var loadingOrderList = true.obs;
  var loadingProductList = true.obs;
  var loadingSliderList = true.obs;
  var loadingUserList = true.obs;
  var loadingOrderSummaryList = true.obs;

  var dataCategoryList = List<GetAllCategoryList>.empty().obs;
//    TASK TO COMPLETE THE OTHER FIVE CLASS
  //var dataOrderList= List<Orders>.empty().obs;
  var dataProductList = List<GetAllProductList>.empty().obs;
  var dataSliderList = List<GetAllSliderList>.empty().obs;
  // var dataUserList= List<AllUserList>.empty().obs;
  //var dataOrderSummaryList= List<GetOrdersSummary>.empty().obs;

  void init(BuildContext context) {
    getAllCategoryList();
    getAllProductList();
    getAllSliderList();
//    TASK TO COMPLETE THE OTHER FIVE CLASS
  }

  getAllCategoryList() async {
    try {
      loadingCategoryList(true).obs;
      var data = await LoadAllApiData.fetchAllCategoryData();
      if (data != null) {
        dataCategoryList.value = data;
      }
    } catch (e) {
      print(e.toString() + "error controller category");
    } finally {
      loadingCategoryList(false).obs;
    }
  }

  getAllProductList() async {
    try {
      loadingProductList(true).obs;
      var data = await LoadAllApiData.fatchAllProductData();
      print(data.toString() + "controller error list");
      if (data != null) {
        dataProductList.value = data;
      }
    } catch (e) {
      print(e.toString() + "error controller product list");
    } finally {
      loadingProductList(false).obs;
    }
  }

  getAllSliderList() async {
    try {
      loadingSliderList(true).obs;
      var data = await LoadAllApiData.fatchAllSliderData();
      if (data != null) {
        dataSliderList.value = data;
      }
    } catch (e) {
      print(e.toString() + "error controller slider list");
    } finally {
      loadingSliderList(false).obs;
    }
  }

//    TASK TO COMPLETE THE OTHER tree CLASS

}
