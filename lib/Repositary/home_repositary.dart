import 'package:weather_mvvm_api_getx/Data/Network/api_services.dart';
import 'package:weather_mvvm_api_getx/Resources/AppUrl/app_url.dart';

class HomeRepository{

  static Future<dynamic> hitApi() async
  {
      var response = await ApiServices().getApi(AppUrl.appUrl);
      return response;
  }
}