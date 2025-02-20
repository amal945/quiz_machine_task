import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../db/question_data/question_db.dart';
import '../model/question_model.dart';

class HomeScreenController extends GetxController {
  @override
  onInit() {
    fetchData();
    super.onInit();
  }
  RxList<QuizResponse> quizzes = <QuizResponse>[].obs;
  TextEditingController searchController = TextEditingController();
  RxString selectedLevel = "All Levels".obs;
  final List<String> levels = ["All Levels","Beginner", "Intermediate", "Advanced"];


  fetchData(){
    quizzes.assignAll(questionsDbData);
  }



}
