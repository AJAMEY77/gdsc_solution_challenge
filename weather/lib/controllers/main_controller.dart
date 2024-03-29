import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:weather/Models/current_weather_moule.dart';
import 'package:weather/Models/hourly_weather_module.dart';
import 'package:weather/services/api_services.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    CurrentWeatherData = getCurrentWeather();
    HourlyWeatherData = getHourlyWeather();
    super.onInit();
  }

  var isDark = false.obs;
  var CurrentWeatherData;
  var HourlyWeatherData;

  changeTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}
