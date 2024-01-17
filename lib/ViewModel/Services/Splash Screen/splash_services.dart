import 'package:get/get.dart';
import 'package:weather_mvvm_api_getx/ViewModel/Controller/home_controller.dart';

class SplashServices {
  static void getApiData(){
    final controller = Get.put(HomeController());
    controller.getData();
  }
}