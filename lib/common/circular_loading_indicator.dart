import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';

class CircularLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    var heightOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: heightOfScreen,
            width: widthOfScreen,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    stops: [
                  0,
                  0.7,
                  1.0
                ],
                    colors: [
                  AppColors.backgroundShade1,
                  AppColors.backgroundShade2,
                  AppColors.backgroundShade3,
                ])),
          ),
          Center(
              child: CircularProgressIndicator(
            backgroundColor: AppColors.buttonShade1,
          )),
        ],
      ),
    );
  }
}
