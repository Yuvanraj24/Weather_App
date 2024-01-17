import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_mvvm_api_getx/Resources/Images/image_assets.dart';
import 'package:weather_mvvm_api_getx/View/Home/Components/small_container.dart';
import 'package:weather_mvvm_api_getx/ViewModel/Controller/days_controller.dart';
import 'package:weather_mvvm_api_getx/ViewModel/Controller/home_controller.dart';

class NextDaysSmallContainer extends StatelessWidget {
   NextDaysSmallContainer({super.key});

  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Obx(() => HomeSmallContainer(text: '${controller.day.value.precipprob.toInt().toString()}%', image: ImageAssets.heavyRain, color: Colors.white38, textColor: Colors.white)),
        const Spacer(),
        Obx(() => HomeSmallContainer(text: '${controller.day.value.windspeed.toInt().toString()}km/h', image: ImageAssets.wind, color: Colors.white38, textColor: Colors.white)),
        const Spacer(),
        Obx(() => HomeSmallContainer(text: '${controller.day.value.humidity.toInt().toString()}%', image: ImageAssets.sun, color: Colors.white38, textColor: Colors.white)),
        const Spacer(),
      ],
    );
  }
}
