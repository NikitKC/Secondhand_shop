import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier{
Future getProduct() async {

  final response = await http.get(Uri.parse('https://second-hand-shop-api.herokuapp.com/api/product/'));
    var res = jsonDecode(response.body);
     var data = res["data"];
    if (response.statusCode == 200) {

      return data;

    } else {
      throw Exception("error here") ;

    }


}
Future postProduct(String pname, String pcategory, File imageFile,
    String condition,
    String selleraddress, String pdescription, String userID,
    String pprice,String delivery) async {
  String token = userID;
  var request = http.MultipartRequest('POST',Uri.parse("https://second-hand-shop-api.herokuapp.com/api/product/add"));
  request.headers.addAll({"auth-token": token});
  request.fields.addAll({
    "product_name":pname,
    "description":pdescription,
    "category":pcategory,
    "price":pprice,
    "address":selleraddress,
    "condition":condition,
    "tags":pname,
    "delivery": delivery
  });
  request.files.add(await http.MultipartFile.fromString("image",  imageFile ));

}

}