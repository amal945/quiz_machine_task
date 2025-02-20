import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_machine_task/constants/app_dimesnions.dart';
import 'package:quiz_machine_task/constants/constants.dart';
import 'package:quiz_machine_task/controller/quiz_controller.dart';

import '../../model/question_model.dart';

class QuizScreen extends StatelessWidget {
  List<Question> questions;
  String tittle;
  int time;
  QuizScreen({super.key, required this.questions, required this.tittle,required this.time});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuizController(questions: questions,time:time ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Obx(() {
              if (!controller.data.isMultipleChoice) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tittle,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.timer_outlined),
                            SizedBox(width: 5),
                            Obx((){
                              int minutes = controller.timeLeft.value ~/ 60;
                              int seconds = controller.timeLeft.value % 60;
                              return Text(
                                "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              );})
                          ],
                        ),
                      ],
                    ),
                    kHeight35,
                    Text(
                      "Question ${controller.index.value + 1} of ${questions.length}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    kHeight20,
                    Text(
                      "${controller.data.questionText}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    kHeight20,
                    GestureDetector(
                      onTap: () {
                        controller.selectedAnswer.value =
                            controller.data.options[0].text;
                      },
                      child: Container(
                        height: AppDimensions.screenHeight / 14,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: controller.selectedAnswer.value ==
                                      controller.data.options[0].text
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("${controller.data.options[0].text}"),
                        ),
                      ),
                    ),
                    kHeight10,
                    GestureDetector(
                      onTap: () {
                        controller.selectedAnswer.value =
                            controller.data.options[1].text;
                      },
                      child: Container(
                        height: AppDimensions.screenHeight / 14,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: controller.selectedAnswer.value ==
                                      controller.data.options[1].text
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("${controller.data.options[1].text}"),
                        ),
                      ),
                    ),
                    kHeight10,
                    GestureDetector(
                      onTap: () {
                        controller.selectedAnswer.value =
                            controller.data.options[2].text;
                      },
                      child: Container(
                        height: AppDimensions.screenHeight / 14,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: controller.selectedAnswer.value ==
                                      controller.data.options[2].text
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("${controller.data.options[2].text}"),
                        ),
                      ),
                    ),
                    kHeight10,
                    GestureDetector(
                      onTap: () {
                        controller.selectedAnswer.value =
                            controller.data.options[3].text;
                      },
                      child: Container(
                        height: AppDimensions.screenHeight / 14,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: controller.selectedAnswer.value ==
                                      controller.data.options[3].text
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("${controller.data.options[3].text}"),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox(height: 5,)),
                    InkWell(
                      onTap: () {
                        controller.submitAnswer(
                            isMultipleChoice: controller.data.isMultipleChoice);
                      },
                      child: Container(
                        height: AppDimensions.screenHeight / 14,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                //Multiple Choice  Question

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tittle,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.timer_outlined),
                            SizedBox(width: 5),
                            Text(
                              "44:53",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    kHeight35,
                    Text(
                      "Question ${controller.index.value + 1} of ${questions.length}",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    kHeight20,
                    Text(
                      "${controller.data.questionText}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    kHeight20,
                    GestureDetector(
                      onTap: () {
                        if (controller.selectedAnswers
                            .contains(controller.data.options[0].text)) {
                          controller.selectedAnswers
                              .remove(controller.data.options[0].text);
                        } else {
                          controller.selectedAnswers
                              .add(controller.data.options[0].text);
                        }
                      },
                      child: Container(
                        height: AppDimensions.screenHeight / 14,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: controller.selectedAnswers
                                      .contains(controller.data.options[0].text)
                                  ? Colors.blue
                                  : Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("${controller.data.options[0].text}"),
                        ),
                      ),
                    ),
                    kHeight10,
                    GestureDetector(
                      onTap: () {
                        if (controller.selectedAnswers
                            .contains(controller.data.options[1].text)) {
                          controller.selectedAnswers
                              .remove(controller.data.options[1].text);
                        } else {
                          controller.selectedAnswers
                              .add(controller.data.options[1].text);
                        }
                      },
                      child: Container(
                        height: AppDimensions.screenHeight / 14,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: controller.selectedAnswers
                                      .contains(controller.data.options[1].text)
                                  ? Colors.blue
                                  : Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("${controller.data.options[1].text}"),
                        ),
                      ),
                    ),
                    kHeight10,
                    GestureDetector(
                      onTap: () {
                        if (controller.selectedAnswers
                            .contains(controller.data.options[2].text)) {
                          controller.selectedAnswers
                              .remove(controller.data.options[2].text);
                        } else {
                          controller.selectedAnswers
                              .add(controller.data.options[2].text);
                        }
                      },
                      child: Container(
                        height: AppDimensions.screenHeight / 14,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: controller.selectedAnswers
                                      .contains(controller.data.options[2].text)
                                  ? Colors.blue
                                  : Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("${controller.data.options[2].text}"),
                        ),
                      ),
                    ),
                    kHeight10,
                    GestureDetector(
                      onTap: () {
                        if (controller.selectedAnswers
                            .contains(controller.data.options[3].text)) {
                          controller.selectedAnswers
                              .remove(controller.data.options[3].text);
                        } else {
                          controller.selectedAnswers
                              .add(controller.data.options[3].text);
                        }
                      },
                      child: Container(
                        height: AppDimensions.screenHeight / 14,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: controller.selectedAnswers
                                      .contains(controller.data.options[3].text)
                                  ? Colors.blue
                                  : Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text("${controller.data.options[3].text}"),
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox(height: 5,)),
                    //Submit Button
                    InkWell(
                      onTap: () {
                        controller.submitAnswer(
                            isMultipleChoice: controller.data.isMultipleChoice);
                      },
                      child: Container(
                        height: AppDimensions.screenHeight / 14,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            })),
      ),
    );
  }
}
