// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/const.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key? key,
    required this.i,
  }) : super(key: key);
  final int i;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 100,
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 0.5),
      ),
      child: Text(
        Const.Cities[i],
        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
