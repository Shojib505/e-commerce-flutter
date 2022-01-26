import 'dart:convert';
import 'package:e_commerce_flutter/assistant/helper.dart';
import 'package:e_commerce_flutter/modal/get_all_category_list.dart';
import 'package:e_commerce_flutter/modal/get_all_product_list.dart';
import 'package:e_commerce_flutter/modal/get_all_slider_list.dart';
import 'package:http/http.dart' as http;

class LoadAllApiData {
  static Future<List<GetAllCategoryList>?> fetchAllCategoryData() async {
    var url = Uri.parse("https://happybuy.appsticit.com/getallcategory");
    var heroResponse =
        await http.get(url, headers: {"Content-Type": "application/json"});
    if (heroResponse.statusCode == 200) {
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode['data']);
      print(convertData + " getting data category list from modal");
      return getAllCategoryListFromJson(convertData);
    }
    return null;
  }

  static Future<List<GetAllProductList>?> fatchAllProductData() async {
    var url = Uri.parse("https://happybuy.appsticit.com/getallproductdata");
    var heroResponse =
        await http.get(url, headers: {"Content-Type": "application/json"});
    if (heroResponse.statusCode == 200) {
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode['data']);
      print(convertData + "get all product list data fatch pirnt");
      return getAllProductListFromJson(convertData);
    }
    return null;
  }

  static Future<List<GetAllSliderList>?> fatchAllSliderData() async {
    var url = Uri.parse(Helper.baseUrl + Helper.getAllSliderListUrl);
    var heroResponse =
        await http.get(url, headers: {"Content-Type": "application/json"});
    if (heroResponse.statusCode == 200) {
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode['data']);
      print(convertData + "getting data slider list from modal");
      return getAllSliderListFromJson(convertData);
    }
    return null;
  }

//    TASK TO COMPLETE THE OTHER FIVE CLASS

}
