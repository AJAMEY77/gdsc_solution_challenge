import 'package:http/http.dart' as http;
import 'package:weather/Models/current_weather_moule.dart';
import 'package:weather/const/string.dart';

var link =
    "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";
var hourlyLink =
    "api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric";

getCurrentWeather() async {
  var response = await http.get(Uri.parse(link));
  if (response.statusCode == 200) {
    var data = currentWeatherDataFromJson(response.body.toString());
    print("data received");
    return data;
  }
}

getHourlyWeather() async {
  var response = await http.get(Uri.parse(hourlyLink));
  if (response.statusCode == 200) {
    var data = currentWeatherDataFromJson(response.body.toString());
    print("data received");
    return data;
  }
}
