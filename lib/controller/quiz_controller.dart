import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_machine_task/view/quiz_screen/widgets/result_screen.dart';

import '../model/question_model.dart';

class QuizController extends GetxController {
  List<Question> questions;
  int time;
  QuizController({required this.questions,required this.time});

  Rx<int> index = 0.obs;
  RxString selectedAnswer = "".obs;
  RxList<String> selectedAnswers = <String>[].obs;
  late Question data;
  Rx<int> score = 0.obs;
  var timeLeft = 0.obs; // Remaining time in seconds
  Timer? _timer;

  @override
  void onInit() {
    data = questions[index.value];
   timeLeft.value = time * 60;
   startTimer();
    super.onInit();
  }

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
      } else {
        timer.cancel();
        Get.off(ResultScreen()); // Auto-submit when time is up
      }
    });
  }

  submitAnswer({required bool isMultipleChoice}) {
    if (isMultipleChoice) {
      if (selectedAnswers.isEmpty) {
        Get.snackbar(
          "",
          "",
          titleText: Text(
            "Error",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Text(
            "Please select an option before submitting",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        );
        return;
      } else {
        List<String> correctAnswersText = data.correctAnswers
            .map((index) => data.options[index].text)
            .toList();
        bool isCorrect = selectedAnswers.length == correctAnswersText.length &&
            selectedAnswers
                .every((answer) => correctAnswersText.contains(answer));
        if (isCorrect) {
          score.value++;
        }
        selectedAnswers.clear();

        // Move to the next question or show results
        if (index.value < questions.length - 1) {
          index.value++;
          data = questions[index.value];
        } else {
          Get.off(ResultScreen());
        }
      }
    } else {
      if (selectedAnswer.isEmpty) {
        Get.snackbar(
          "",
          "",
          titleText: Text(
            "Error",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Text(
            "Please select an option before submitting",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        );
        return;
      } else {
        // Validate single-choice answer
        if (selectedAnswer.value == data.options[data.correctAnswers[0]].text) {
          score.value++;
        }
        selectedAnswer.value = "";

        // Move to the next question or show results
        if (index.value < questions.length - 1) {
          index.value++;
          data = questions[index.value];
        } else {
          Get.off(ResultScreen());
        }
      }
    }
  }
}
