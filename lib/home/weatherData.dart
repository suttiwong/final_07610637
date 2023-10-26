//{"city":"Bangkok",
// "country":"Thailand",
// "lastUpdated":"2023-10-26 09:45",
// "tempC":29,
// "tempF":84.2,
// "feelsLikeC":34.7,
// "feelsLikeC":94.4,
// "windKph":13,"windMph":8.1,
// "humidity":79,
// "uv":6,
// "condition":{"text":"Partly cloudy","icon":"https://cdn.weatherapi.com/weather/128x128/day/116.png",
// "code":1003}}
class WeatherData {
  final String city;
  final String country;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windKph;
  final double windMph;
  final int humidity;
  final int uv;

  final WeatherCondition condition;

  WeatherData({
    required this.city,
    required this.country,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.uv,
    required this.condition,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: json['city'] ?? '',
      // เพิ่มการตรวจสอบเพื่อรับค่า city
      country: json['country'] ?? '',
      // เพิ่มการตรวจสอบเพื่อรับค่า country
      lastUpdated: json['lastUpdated'] ?? '',
      // เพิ่มการตรวจสอบเพื่อรับค่า lastUpdated
      tempC: (json['tempC'] as num?)?.toDouble() ?? 0.0,
      // เพิ่มการตรวจสอบเพื่อรับค่า tempC
      tempF: (json['tempF'] as num?)?.toDouble() ?? 0.0,
      // เพิ่มการตรวจสอบเพื่อรับค่า tempF
      feelsLikeC: (json['feelsLikeC'] as num?)?.toDouble() ?? 0.0,
      // เพิ่มการตรวจสอบเพื่อรับค่า feelsLikeC
      feelsLikeF: (json['feelsLikeF'] as num?)?.toDouble() ?? 0.0,
      // เพิ่มการตรวจสอบเพื่อรับค่า feelsLikeF
      windKph: (json['windKph'] as num?)?.toDouble() ?? 0.0,
      // เพิ่มการตรวจสอบเพื่อรับค่า windKph
      windMph: (json['windMph'] as num?)?.toDouble() ?? 0.0,
      // เพิ่มการตรวจสอบเพื่อรับค่า windMph
      humidity: (json['humidity'] as num?)?.toInt() ?? 0,
      // เพิ่มการตรวจสอบเพื่อรับค่า humidity
      uv: (json['uv'] as num?)?.toInt() ?? 0, // เพิ่มการตรวจสอบเพื่อรับค่า uv
      condition: WeatherCondition.fromJson(json['condition'] ?? {}), // เพิ่มการตรวจสอบเพื่อรับค่า condition
    );
  }
}


  class WeatherCondition {
  final String text;
  final String icon;
  final int code;

  WeatherCondition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) {
    return WeatherCondition(
      text: json['text'],
      icon: json['icon'],
      code: int.parse(json['code'].toString()),
    );
  }
}
