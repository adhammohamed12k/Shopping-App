import 'package:flutter/cupertino.dart';
import 'package:qiuz_adham_mohamed/Models/App-Model.dart';
import 'package:qiuz_adham_mohamed/Services/Login-Service.dart';
import 'package:qiuz_adham_mohamed/Services/SignUp-Service.dart';

class AppProvider with ChangeNotifier
{
  AppModel? appModel;

  Future<bool> fetchDataSignup(String name , String phone , String email , String password) async
  {
    try
    {
      appModel = await SignUpServices.AddDataSignUp(
          name: name,
          phone: phone,
          email: email,
          password: password,
      );
      notifyListeners();
      return true;
    }
    catch(ee)
    {
      print(ee);
    }
    return false;

  }
  Future<bool> fetchDataLogin( String email , String password) async
  {
    try
    {
      await LoginServices.AddDataLogin(email: email, password: password);
      notifyListeners();
      return true;
    }
    catch(ee)
    {
      print(ee);

    }
    return false;
  }
}