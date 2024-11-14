import 'package:dio/dio.dart';
import 'package:qiuz_adham_mohamed/Models/App-Model.dart';
import 'package:qiuz_adham_mohamed/Models/Product-Model.dart';
class AppProduct
{
  static Dio dio = Dio();
 static Future<ProductModel> GetData() async
  {
    try
    {
      Response response = await dio.get("https://student.valuxapps.com/api/home");
      return ProductModel.fromjson(response.data);
    }
    catch(ee)
    {
      throw Exception("Error: $ee");
    }

  }
}