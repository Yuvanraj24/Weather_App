import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:weather_mvvm_api_getx/Resources/Images/image_assets.dart';
import 'package:weather_mvvm_api_getx/Utilities/utilities.dart';
import 'package:weather_mvvm_api_getx/ViewModel/Controller/home_controller.dart';

class Location extends StatelessWidget {
   Location({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              controller.getAddress(),
              style: const TextStyle(
                height: 0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25
              )),
            Text(
              Utilities.formatDate(DateTime.now()),
              style: TextStyle(
                color: Colors.grey.withOpacity(.7),
                fontWeight: FontWeight.bold
              ))
          ]),
        const Spacer(),
        SizedBox(
          height: 150,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                  ImageAssets.map,
                fit: BoxFit.cover,
              ),
            ),
          ))

      ],
    );
  }
}
