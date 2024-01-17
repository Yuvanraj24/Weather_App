import 'package:flutter/material.dart';
import 'package:weather_mvvm_api_getx/Resources/Colors/colors.dart';
import 'package:weather_mvvm_api_getx/Resources/Images/image_assets.dart';
import 'package:weather_mvvm_api_getx/ViewModel/Services/Splash%20Screen/splash_services.dart';

import '../../ViewModel/Controller/home_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SplashServices.getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset(ImageAssets.umbrella,
              height: 200,
              width: 200,
          ),
        ),
      ),
    );
  }
}
