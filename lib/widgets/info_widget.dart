// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_app/const.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.dataName,
    required this.data,
  }) : super(key: key);
  final String dataName;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 32),
            Container(
                alignment: Alignment.center,
                height: 60,
                width: 100,
                child: Text(dataName, style: Styles.smallTitleStyle.copyWith(fontSize: 10))),
            const Spacer(),
            Text(data, style: Styles.smallTitleStyle.copyWith(fontSize: 25, fontWeight: FontWeight.bold)),
            const Spacer(),
          ],
        ),
        const Divider(
          color: Colors.white,
          thickness: 0.3,
        ),
      ],
    );
  }
}
