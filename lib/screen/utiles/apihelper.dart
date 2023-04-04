import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:productapp/screen/home/modal/Product_modal.dart';

class apiHelper{

  List<dynamic> jsonList = [];

  Future<List> callApi() async {
    String apiLink = "https://fakestoreapi.com/products";

    Uri uri = Uri.parse(apiLink);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    jsonList = json.map((e) => Product().factory(e)).toList();
    return jsonList;
  }
}
