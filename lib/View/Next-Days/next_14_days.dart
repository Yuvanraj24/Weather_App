import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:weather_mvvm_api_getx/Resources/Colors/colors.dart';
import 'package:weather_mvvm_api_getx/View/Next-Days/Components/app_bar.dart';
import 'package:weather_mvvm_api_getx/View/Next-Days/Components/bottom_list.dart';
import 'package:weather_mvvm_api_getx/View/Next-Days/Components/center_card.dart';
import 'package:weather_mvvm_api_getx/View/Next-Days/Components/days_list.dart';
import 'package:weather_mvvm_api_getx/ViewModel/Controller/days_controller.dart';
import 'package:weather_mvvm_api_getx/ViewModel/Controller/home_controller.dart';

class NextDays extends StatelessWidget {
  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());
   NextDays({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child:  Stack(
              alignment: Alignment.center,
              children: [
                  Column(
                    children: [
                     const SizedBox(
                       height: 20,
                     ),
                     const NextDaysAppBar(),
                     const SizedBox(height: 20),
                     DaysList(),
                    ]
                  ),
                Positioned(
                  bottom: 1,
                  child: Container(
                    height: size.height / 1.9,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      )
                    ),
                  ),
                ),
                BottomList(),
                 Hero(
                    tag: 'TAG',
                    child: Material(
                      color: Colors.transparent,
                      child: CenterCard(),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
