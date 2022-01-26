import 'dart:convert';
import 'package:e_commerce_flutter/modal/get_all_category_list.dart';
import 'package:e_commerce_flutter/modal/get_all_product_list.dart';
import 'package:http/http.dart' as http;

class LoadAllApiData {
  static Future<List<GetAllCategoryList>?> fetchAllCategoryData() async {
    var url = Uri.parse("https://happybuy.appsticit.com/getallcategory");
    var heroResponse =
        await http.get(url, headers: {"Content-Type": "application/json"});
    if (heroResponse.statusCode == 200) {
      var jsonDecode = json.decode(heroResponse.body);
      var convertData = json.encode(jsonDecode['data']);
      print(convertData + " hello");
      return getAllCategoryListFromJson(convertData);
    }
    return null;
  }

  static Future<List<GetAllProductList>?> fatchAllProductListData() async {
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

//    TASK TO COMPLETE THE OTHER FIVE CLASS

}
