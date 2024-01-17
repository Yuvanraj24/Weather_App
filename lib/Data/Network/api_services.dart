import 'dart:convert';
import 'dart:io';

import 'package:weather_mvvm_api_getx/Data/Network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:weather_mvvm_api_getx/Data/app_exceptions.dart';

class ApiServices extends BaseApiServices {

  dynamic jsonResponse(http.Response response)
  {
    switch(response.statusCode){
      case 200 :
        var jsonRes = jsonDecode(response.body);
        return jsonRes;

      case 400 :
        var jsonRes = jsonDecode(response.body);
        return jsonRes;

      default:
        throw FetchDataException('Error while communication ${response.statusCode}');
    }
  }


  @override
  Future getApi(String url) async
  {
    var jsonData;
    try{
      var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonData = jsonResponse(response);
    } on RequestTimeOut {
      throw RequestTimeOut('Request Timeout');
    } on SocketException{
      throw InternetException('No Internet');
    }
    return jsonData;
  }
}