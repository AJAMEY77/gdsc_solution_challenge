import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather/Models/current_weather_moule.dart';
import 'package:weather/const/colors.dart';
import 'package:weather/const/images.dart';
import 'package:weather/controllers/main_controller.dart';
import 'package:weather/services/api_services.dart';

class WhetherApp extends StatelessWidget {
  const WhetherApp({super.key});

  @override
  Widget build(BuildContext context) {
    var date = DateFormat("yMMMMd").format(DateTime.now()); //to get date
    var theme = Theme.of(context);
    var controller = Get.put(MainController());

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: "$date".text.color(theme.primaryColor).make(), //to display date

        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Obx(
            () => IconButton(
                onPressed: () {
                  controller.changeTheme();
                  // Get.changeThemeMode(ThemeMode.dark);
                },
                icon: Icon(
                  controller.isDark.value ? Icons.light_mode : Icons.dark_mode,
                  color: theme.iconTheme.color,
                )),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: theme.iconTheme.color,
              ))
        ],
      ),
      body: FutureBuilder(
        future: controller.CurrentWeatherData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            CurrentWeatherData data = snapshot.data;

            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "${data.name}"
                        .text
                        .uppercase
                        .fontFamily("poppins_bold")
                        .size(32)
                        .letterSpacing(3)
                        .color(theme.primaryColor)
                        .make(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/weather/${data.weather![0].icon}.png",
                          width: 80,
                          height: 80,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "${data.main.temp}°",
                              style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 64,
                                  fontFamily: "poppins")),
                          TextSpan(
                              text: "\t${data.weather![0].main}",
                              style: TextStyle(
                                  color: theme.primaryColor,
                                  letterSpacing: 3,
                                  fontSize: 14,
                                  fontFamily: "poppins"))
                        ]))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: null,
                          icon: Icon(
                            Icons.expand_less_rounded,
                            color: theme.iconTheme.color,
                          ),
                          label: "${data.main.tempMax}°"
                              .text
                              .color(theme.iconTheme.color)
                              .make(),
                        ),
                        TextButton.icon(
                          onPressed: null,
                          icon: Icon(
                            Icons.expand_more_rounded,
                            color: theme.iconTheme.color,
                          ),
                          label: "${data.main.tempMin}°"
                              .text
                              .color(theme.iconTheme.color)
                              .make(),
                        )
                      ],
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(3, (index) {
                        var iconList = [clouds, humidity, windspeed];
                        var values = [
                          "${data.clouds.all}%",
                          "${data.main.humidity}%",
                          "${data.wind.speed}km/h"
                        ];
                        return Column(children: [
                          Image.asset(
                            iconList[index],
                            width: 60,
                            height: 60,
                          )
                              .box
                              .gray300
                              .padding(const EdgeInsets.all(8))
                              .roundedSM
                              .make(),
                          10.heightBox,
                          values[index].text.gray400.make()
                        ]);
                      }),
                    ),
                    10.heightBox,
                    const Divider(),
                    10.heightBox,
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                "${index + 1} AM".text.gray200.make(),
                                Image.asset(
                                  "assets/weather/09n.png",
                                  width: 80,
                                ),
                                "38°".text.white.make(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    10.heightBox,
                    const Divider(),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Next 7 days"
                            .text
                            .semiBold
                            .size(16)
                            .color(theme.primaryColor)
                            .make(),
                        TextButton(
                            onPressed: () {}, child: "View All".text.make())
                      ],
                    ),
                    ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          var day = DateFormat("EEEE").format(DateTime.now()
                              .add(Duration(days: index + 1))); //to get date
                          return Card(
                            color: theme.cardColor,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: day.text.semiBold
                                          .color(theme.primaryColor)
                                          .make()),
                                  Expanded(
                                    child: TextButton.icon(
                                      onPressed: null,
                                      icon: Image.asset(
                                        "assets/weather/50n.png",
                                        width: 40,
                                      ),
                                      label: "".text.make(),
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "37°",
                                        style: TextStyle(
                                          color: theme.primaryColor,
                                          fontFamily: "poppins",
                                          fontSize: 16,
                                        )),
                                    TextSpan(
                                        text: "37°",
                                        style: TextStyle(
                                          color: theme.primaryColor,
                                          fontFamily: "poppins",
                                          fontSize: 16,
                                        )),
                                  ]))
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
