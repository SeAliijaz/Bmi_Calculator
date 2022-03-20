import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  String result = '';
  double height = 0;
  double weight = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  child: Image.asset(
                    'images/bmilogo.png',
                    height: 180,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  genderButton("Male", Colors.blue, 0),
                  genderButton("Fe-Male", Colors.red, 1),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Your Height in Cm : ',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _heightController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    labelText: 'Your Height in Cm',
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Your Weight in Kg : ',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.line_weight),
                    labelText: 'Your Weight in Kg',
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      height = double.parse(_heightController.value.text);
                      weight = double.parse(_weightController.value.text);
                    });
                    calc_bmi(height, weight);
                  },
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  'Your BMI is : $result',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lusitana(
                    textStyle: TextStyle(
                      fontSize: 25.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  String calc_bmi(double height, double weight) {
    double finalResult = weight / (height * height / 10000);
    String bmi = finalResult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget genderButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        height: 80.0,
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        child: MaterialButton(
          color: currentIndex == index ? color : Colors.grey[200],
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: GoogleFonts.lateef(
              textStyle: TextStyle(
                color: currentIndex == index ? Colors.white : color,
                fontSize: 30.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
