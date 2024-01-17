
import 'dart:async';

import 'package:get/get.dart';
import 'package:weather_mvvm_api_getx/Model/data_model.dart';
import 'package:weather_mvvm_api_getx/Repositary/home_repositary.dart';
import 'package:weather_mvvm_api_getx/Resources/Images/image_assets.dart';
import 'package:weather_mvvm_api_getx/Utilities/utilities.dart';
import 'package:weather_mvvm_api_getx/View/Home/home_screen.dart';


class HomeController extends GetxController
{

  Rx<DataModel?> model = Rx<DataModel?>(null);
  Rx<Hours?> hours = Rx<Hours?>(null);
  Rx<int> currentIndex = 0.obs;
  RxBool animator = false.obs;

  int getCurrentIndex() => currentIndex.value;
  bool compareIndex(int index) => index == currentIndex.value;
  String getHour(int index) => Utilities.formatTimeWithoutAmPm(model.value!.days![0].hours![index].datetime.toString());
  String getImage(int index) => Utilities.imageMap[model.value!.days![0].hours![index].conditions.toString()] == null
      ? ImageAssets.nightStarRain
      : Utilities.imageMap[model.value!.days![0].hours![index].conditions.toString()]!;

  String getAddress() => '${model.value!.address.toString()},\n${model.value!.timezone.toString()}';
  String getCondition() => hours.value!.conditions.toString();
  String getCurrentTemp() => hours.value!.temp!.toInt().toString();
  String getFeelLike()  => hours.value!.feelslike.toString();
  String getCloudOver() => hours.value!.cloudcover!.toInt().toString();
  String getWindSpeed() => hours.value!.windspeed!.toInt().toString();
  String getHumidity() => hours.value!.humidity!.toInt().toString();

  getData(){
    HomeRepository.hitApi().then((value) {
        model.value = DataModel.fromJson(value);
        for(int i=0; i<model.value!.days![0].hours!.length; i++){
          if(Utilities.checkTime(model.value!.days![0].hours![i].datetime.toString())){
            hours.value = model.value!.days![0].hours![i];
            currentIndex.value = i;
            break;
          }
        }
        Get.off(const HomeScreen());
    });
  }

  setHour(int index){
    Timer(const Duration(milliseconds: 100),() => animator.value = true);
    currentIndex.value = index;
    hours.value = model.value!.days![0].hours![index];
    Timer(const Duration(milliseconds: 100),() => animator.value = false);
    
  }

}