import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_machine_task/constants/app_dimesnions.dart';
import 'package:quiz_machine_task/constants/constants.dart';
import 'package:quiz_machine_task/controller/home_screen_controller.dart';
import 'package:quiz_machine_task/view/quiz_screen/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(HomeScreenController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Flutter Developer Tests",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Master your Flutter development skills with our comprehensive assessments",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                kHeight35,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: TextField(
                          controller: controller.searchController,
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            hintText: "Search exams...",
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    kWidth5,
                    Obx(() => PopupMenuButton<String>(
                          onSelected: (String value) {
                            controller.selectedLevel.value = value;
                          },
                          borderRadius: BorderRadius.circular(18),
                          elevation: 5,
                          itemBuilder: (BuildContext context) {
                            return controller.levels.map((String level) {
                              return PopupMenuItem<String>(
                                value: level,
                                child: Row(
                                  children: [
                                    if (controller.selectedLevel.value == level)
                                      Icon(Icons.check, color: Colors.black),
                                    // Tick on the left
                                    SizedBox(width: 10),
                                    // Space between tick and text
                                    Text(level,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    // Text color black
                                  ],
                                ),
                              );
                            }).toList();
                          },
                          color: Colors.grey.shade300,
                          // Dropdown background color
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 11),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.selectedLevel.value,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
                kHeight35,
                Text(
                  "Flutter Core",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Essential Flutter Development courses",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.3),
                ),

                /// ListView inside a constrained container
                Container(
                  height: AppDimensions.screenHeight / 1.2,
                  child: Obx(() {
                    return ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      itemCount: controller.quizzes.length,
                      itemBuilder: (context, index) {
                        final data = controller.quizzes[index];
                        Color badgeColor = Colors.blue;
                        Color badgeTextColor = Colors.white;
                        if (data.level == "Beginner") {
                          badgeColor = Colors.green.shade100;
                          badgeTextColor = Colors.green.shade900;
                        } else if (data.level == "Intermediate") {
                          badgeColor = Colors.yellow.shade200;
                          badgeTextColor = Colors.brown;
                        }
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: AppDimensions.screenWidth / 1.2,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 0))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.quizName,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: badgeColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 3),
                                          child: Center(
                                            child: Text(
                                              data.level,
                                              style: TextStyle(
                                                  color: badgeTextColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  kHeight5,
                                  Text(
                                    data.description,
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 14),
                                  ),
                                  kHeight15,
                                  Container(
                                    width: AppDimensions.screenWidth / 1.5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.timer_outlined,
                                                  color: Colors.grey,
                                                ),
                                                kWidth10,
                                                Text(
                                                  "${data.time.toString()} minutes",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            kHeight20,
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.people,
                                                  color: Colors.grey,
                                                ),
                                                kWidth10,
                                                Text(
                                                  "${data.totalAttempted}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.menu_book,
                                                  color: Colors.grey,
                                                ),
                                                kWidth10,
                                                Text(
                                                  "${data.numberOfQuestions} questions",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            kHeight20,
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.verified_outlined,
                                                  color: Colors.grey,
                                                ),
                                                kWidth10,
                                                Text(
                                                  "${data.passPercentage}% pass rate",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  kHeight35,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width:
                                              AppDimensions.screenWidth / 1.8,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                                data.modules.length, (index) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 3),
                                                  child: Center(
                                                    child: Text(
                                                      data.modules[index],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(QuizScreen(
                                                questions: data.questions,tittle: data.quizName,time: data.time,));
                                          },
                                          child: Container(
                                            width:
                                                AppDimensions.screenWidth / 4,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 5),
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    kWidth5,
                                                    Text(
                                                      "Start",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                    ),
                                                    kWidth15,
                                                    Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  kHeight10,
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
