import 'package:dio/dio.dart';
import 'package:qiuz_adham_mohamed/Models/App-Model.dart';
class SignUpServices
{
  static Dio dio = Dio();
  
  static Future<AppModel> AddDataSignUp(
      {required String name,required String phone,required String email,required String password}) async
  {
      Response response = await dio.post(
        "https://student.valuxapps.com/api/register",
        data: {
          'name' : name,
          'phone' : phone,
          'email' : email,
          'password' : password,
        }
      );
      if(response.statusCode! <= 200 || response.statusCode! > 300)
        {
          print(response.data);
          return AppModel.fromjson(response.data);
        }
      else
        {
         throw Exception("Error Server");
        }

  }
}