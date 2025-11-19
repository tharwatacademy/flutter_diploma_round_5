import 'package:bmi_application/models/bmi_input_model.dart';
import 'package:bmi_application/widgets/gender_selection_section.dart';
import 'package:bmi_application/widgets/height_selection_item.dart';
import 'package:bmi_application/widgets/result_screen.dart';
import 'package:flutter/material.dart';

import 'home_app_bar.dart';
import 'weight_age_section.dart';

// []
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// [gender , height , weight , age]bmi input model
class _HomeScreenState extends State<HomeScreen> {
  BmiInputModel bmiInputModel = BmiInputModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff03051A),

      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(),
            SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  spacing: 32,
                  children: [
                    Expanded(
                      child: GenderSelectionSection(
                        bmiInputModel: bmiInputModel,
                      ),
                    ),
                    Expanded(
                      child: HeightSelectionItem(bmiInputModel: bmiInputModel),
                    ),
                    Expanded(
                      child: WeightAgeSection(bmiInputModel: bmiInputModel),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print(bmiInputModel);
                  double bmiResult = bmiInputModel.calculateBmi();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultScreen(bmiResult: bmiResult);
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF72585),
                  padding: EdgeInsets.symmetric(horizontal: 64, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
