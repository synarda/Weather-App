import 'package:get/get.dart';
import 'package:weather_app/const.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/api_service.dart';

class HomeController extends GetxController {
  final weather = WeatherModel("", "", "", 0, "", -1, "", 0, 0, 0, "").obs;
  RxDouble moonRight = 400.0.obs;
  RxDouble sunLeft = 400.0.obs;
  RxDouble degreeLeft = 30.0.obs;
  final backgrounColor = Colorss.dayColor.obs;
  RxInt dropdownIdx = 0.obs;

  @override
  void onInit() {
    getWeather(Const.Cities[0]);
    super.onInit();
  }

  void getWeather(String place) async {
    final result = await ApiService.getWeather(place);
    if (result != null) {
      weather.value = result;
      dayOrNight();
    }
  }

  void dayOrNight() {
    if (weather.value.isDay == 1) {
      degreeLeft.value = 30;
      moonRight.value = 350.0;
      sunLeft.value = -100.0;
      backgrounColor.value = Colorss.dayColor;
    } else {
      degreeLeft.value = 150;
      sunLeft.value = 350.0;
      moonRight.value = -100.0;
      backgrounColor.value = Colorss.nightColor;
    }
  }
}
