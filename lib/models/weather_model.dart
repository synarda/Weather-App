// Among 33 data, I will use only these, so I called the data one by one.
class WeatherModel {
  final String name;
  final String country;
  final String tzId;
  final double tempC;
  final String status;
  final int isDay;
  final String img;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDirection;

  WeatherModel(
    this.name,
    this.country,
    this.tzId,
    this.tempC,
    this.status,
    this.isDay,
    this.img,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDirection,
  );
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        json["location"]["name"],
        json["location"]["country"],
        json["location"]["tz_id"],
        json["current"]["temp_c"],
        json["current"]["condition"]["text"],
        json["current"]["is_day"],
        json["current"]["condition"]["icon"],
        json["current"]["wind_mph"],
        json["current"]["wind_kph"] as double,
        json["current"]["wind_degree"],
        json["current"]["wind_dir"]);
  }
}
