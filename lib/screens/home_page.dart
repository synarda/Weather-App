import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/const.dart';
import 'package:weather_app/controllers/home_controller.dart';
import 'package:weather_app/widgets/all_info_widget.dart';
import 'package:weather_app/widgets/degree_widget.dart';
import 'package:weather_app/widgets/dropDown.dart';
import 'package:weather_app/widgets/image_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return GestureDetector(
      //change city when we swipe the screen
      onHorizontalDragEnd: (details) {
        final velocity = details.primaryVelocity ?? 0;
        if (velocity < 0) {
          if (controller.dropdownIdx.value < 19) {
            controller.dropdownIdx.value += 1;
            controller.getWeather(Const.Cities[controller.dropdownIdx.value]);
          }
        }
        if (velocity > 0) {
          if (controller.dropdownIdx.value > 0) {
            controller.dropdownIdx.value -= 1;
            controller.getWeather(Const.Cities[controller.dropdownIdx.value]);
          }
        }
      },
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Obx(
            () => Stack(
              children: [
                // Background Color
                Positioned.fill(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    height: Get.height,
                    width: Get.width,
                    color: controller.backgrounColor.value,
                  ),
                ),
                // City Name
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(controller.weather.value.name, style: Styles.bigTitleStyle),
                  ),
                ),
                // Weather Photo
                AnimatedPositioned(
                  top: 150,
                  left: controller.degreeLeft.value,
                  duration: const Duration(seconds: 1),
                  child: Column(
                    children: [
                      ImageWidget(
                        img: controller.weather.value.img,
                        status: controller.weather.value.status,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                // Moon Lottie
                AnimatedPositioned(
                  top: 50,
                  right: -controller.moonRight.value,
                  duration: const Duration(seconds: 1),
                  child: Lottie.asset(
                    "lib/assets/json/moon.json",
                  ),
                ),
                // Sun Lottie
                AnimatedPositioned(
                  top: 50,
                  left: -controller.sunLeft.value,
                  duration: const Duration(seconds: 1),
                  child: Lottie.asset(
                    "lib/assets/json/sun.json",
                  ),
                ),
                // Degree
                AnimatedPositioned(
                  top: 260,
                  left: controller.degreeLeft.value,
                  duration: const Duration(seconds: 1),
                  child: Column(
                    children: [
                      DegreeWidget(
                        degree: controller.weather.value.tempC.toString(),
                      ),
                    ],
                  ),
                ),
                // City Dropdown
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(() => AllInfoWidget(weather: controller.weather.value)),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: DropdownButton<int>(
                            icon: const Icon(Icons.keyboard_arrow_up_rounded, color: Colors.white),
                            underline: const SizedBox(),
                            dropdownColor: controller.backgrounColor.value,
                            onChanged: (newValue) {
                              controller.dropdownIdx.value = newValue!;
                              controller.getWeather(Const.Cities[newValue]);
                            },
                            value: controller.dropdownIdx.value,
                            items: [
                              for (int i = 0; i < Const.Cities.length; i++)
                                DropdownMenuItem(value: i, child: DropDownWidget(i: i))
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
