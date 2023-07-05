// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/blur.dart';
import 'package:weather_app/widgets/info_widget.dart';

class AllInfoWidget extends StatelessWidget {
  const AllInfoWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(children: [
        const BlurWidget(),
        Column(
          children: [
            InfoWidget(
              dataName: "Wind MPH",
              data: weather.windMph.toString(),
            ),
            InfoWidget(
              dataName: "Wind KPH",
              data: weather.windKph.toString(),
            ),
            InfoWidget(
              dataName: "Wind Degree",
              data: weather.windDegree.toString(),
            ),
            InfoWidget(dataName: "Wind Direction", data: weather.windDirection),
          ],
        ),
      ]),
    );
  }
}
