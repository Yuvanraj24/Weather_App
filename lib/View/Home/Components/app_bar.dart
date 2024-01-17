import 'package:flutter/material.dart';
import 'package:weather_mvvm_api_getx/Resources/Images/image_assets.dart';
class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.menu)),

        const Spacer(),

        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.notifications_none_rounded)),

        const SizedBox(width: 10),
        
        Image.asset(ImageAssets.nightRain,
          height: 30,
          width: 30,
        )

      ],
    );
  }
}
