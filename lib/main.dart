import 'package:flutter/material.dart';
import 'package:wa/core/const/constants.dart';
import 'features/weather/presentation/pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(

      ).copyWith(scaffoldBackgroundColor: bgColor, iconTheme: const IconThemeData(color: Colors.white),
          inputDecorationTheme: const InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: inputBorderColor
                ),
              ),
            fillColor: inputFillColor,
            filled: true,
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: inputBorderColor),
            ),
          ),
      ),
      home: const WeatherPage(),
    );
  }
}

