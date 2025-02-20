import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_machine_task/constants/app_dimesnions.dart';
import 'package:quiz_machine_task/constants/constants.dart';
import 'package:quiz_machine_task/controller/quiz_controller.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<QuizController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: AppDimensions.screenWidth /1.2,
                height: AppDimensions.screenHeight/2.5,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                      color: Colors.black.withOpacity(0.2)
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Test Complete!",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    kHeight50,
                    Obx(() {
                      return Text(
                        "Your Score ${((controller.score.value / controller.questions.length) * 100)}%",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      );
                    }),
                    kHeight20,
                    Obx(() {
                      return Text(
                        "Correct Answers : ${controller.score.value} / ${controller.questions.length}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      );
                    }),
                    kHeight25,
                    Obx(() {
                      double percentage = (controller.score.value / controller.questions.length) * 100;
                      if (percentage <= 50.0) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.dangerous, color: Colors.red),
                            kWidth5,
                            Text("Need improvement. Keep practicing", style: TextStyle(color: Colors.red)),
                          ],
                        );
                      } else if (percentage < 70.0  && percentage > 50) {
                        return Text("Good work, Keep Learning", style: TextStyle(color: Colors.yellow));
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle_outline, color: Colors.green),
                            // kWidth5,
                            Text("Good work, keep it up!", style: TextStyle(color: Colors.green)),
                          ],
                        );
                      }

                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
