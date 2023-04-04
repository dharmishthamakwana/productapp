import 'package:flutter/foundation.dart';
import '../../../utiles/apihelper.dart';

class ProductProvider extends ChangeNotifier {
  List<dynamic> apiList = [];

  Future<void> apiCalling() async {
    apiHelper a1 = apiHelper();

    apiList = await a1.callApi();
    notifyListeners();
  }
}
