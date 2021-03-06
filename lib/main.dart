import 'package:bmi_calculator/Bmi_Calc_Screen/bmi_calc_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          home: BMICalculatorScreen(),
        );
      }),
    );
  }
}
