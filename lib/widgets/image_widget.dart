// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/const.dart';
import 'package:weather_app/controllers/home_controller.dart';
import 'package:weather_app/widgets/blur.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.img,
    required this.status,
  }) : super(key: key);
  final String img;
  final String status;
  @override
  Widget build(BuildContext context) {
    final controllerHome = Get.find<HomeController>();
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: 100,
      width: 250,
      decoration: BoxDecoration(
        color: controllerHome.backgrounColor.value,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          const BlurWidget(),
          Align(
              alignment: Alignment.center,
              child: img.isEmpty
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        Image.network("https:$img"),
                        const SizedBox(height: 4),
                        Text(
                          status,
                          style: Styles.smallTitleStyle.copyWith(fontSize: 11),
                        )
                      ],
                    )),
        ],
      ),
    );
  }
}
