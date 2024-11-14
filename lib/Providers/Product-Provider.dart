import 'package:flutter/cupertino.dart';
import 'package:qiuz_adham_mohamed/Models/Product-Model.dart';
import 'package:qiuz_adham_mohamed/Services/App-Products.dart';

class ProductProvider with ChangeNotifier
{
  ProductModel? productModel;
  Future<void> fetchData() async{
      productModel = await AppProduct.GetData();
        notifyListeners();
  }
}