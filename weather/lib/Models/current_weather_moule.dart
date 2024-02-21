// To parse this JSON data, do
//
//     final currentWeatherData = currentWeatherDataFromJson(jsonString);

import 'dart:convert';

CurrentWeatherData currentWeatherDataFromJson(String str) =>
    CurrentWeatherData.fromJson(json.decode(str));

class CurrentWeatherData {
  // Coord coord;
  List<Weather> weather;
  // String base;
  Main main;
  // int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  // Sys sys;
  // int timezone;
  // int id;
  String name;
  // int cod;

  CurrentWeatherData({
    // required this.coord,
    required this.weather,
    // required this.base,
    required this.main,
    // required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    // required this.sys,
    // required this.timezone,
    // required this.id,
    required this.name,
    // required this.cod,
  });

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherData(
        // coord: Coord.fromJson(json["coord"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        // base: json["base"],
        main: Main.fromJson(json["main"]),
        // visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        // sys: Sys.fromJson(json["sys"]),
        // timezone: json["timezone"],
        // id: json["id"],
        name: json["name"],
        // cod: json["cod"],
      );
}

class Clouds {
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

// class Coord {
//   double lon;
//   double lat;

//   Coord({
//     required this.lon,
//     required this.lat,
//   });

//   factory Coord.fromJson(Map<String, dynamic> json) => Coord(
//         lon: json["lon"]?.toDouble(),
//         lat: json["lat"]?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "lon": lon,
//         "lat": lat,
//       };
// }

class Main {
  int temp;
  int tempMin;
  int tempMax;
  int humidity;
  int seaLevel;
  int grndLevel;

  Main({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: (json["temp"] as double?)?.round() ?? 0,
        tempMin: (json["temp_min"] as double?)?.round() ?? 0,
        tempMax: (json["temp_max"] as double?)?.round() ?? 0,
        humidity: json["humidity"] ?? 0,
        seaLevel: json["sea_level"] ?? 0,
        grndLevel: json["grnd_level"] ?? 0,
      );
}

// class Sys {
//   String country;
//   int sunrise;
//   int sunset;

//   Sys({
//     required this.country,
//     required this.sunrise,
//     required this.sunset,
//   });

//   factory Sys.fromJson(Map<String, dynamic> json) => Sys(
//         country: json["country"],
//         sunrise: json["sunrise"],
//         sunset: json["sunset"],
//       );

//   Map<String, dynamic> toJson() => {
//         "country": country,
//         "sunrise": sunrise,
//         "sunset": sunset,
//       };
// }

class Weather {
  // int id;
  String main;
  // String description;
  String icon;

  Weather({
    // required this.id,
    required this.main,
    // required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        // id: json["id"],
        main: json["main"],
        // description: json["description"],
        icon: json["icon"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "main": main,
  //       "description": description,
  //       "icon": icon,
  //     };
}

class Wind {
  double speed;
  int deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
