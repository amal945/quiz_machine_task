import '../../model/question_model.dart';

final questionsDbData = [
  QuizResponse(
    quizName: "Flutter Fundamentals",
    description: "Test your knowledge of Flutter basics!",
    level: "Beginner",
    time: 45,
    totalAttempted: 3500,
    numberOfQuestions: 20,
    passPercentage: 70,
    type: "Core",
    modules : ["widgets","layouts","basics"],
    answers: {
      1: [1],
      2: [0, 2],
      3: [3],
      4: [1],
      5: [0, 2],
      6: [0],
      7: [2],
      8: [3],
      9: [1, 2],
      10: [0],
      11: [2],
      12: [1, 3],
      13: [2],
      14: [0, 1],
      15: [2],
      16: [1],
      17: [3],
      18: [0, 2],
      19: [1],
      20: [3],
    },
    questions: [
      Question(
        id: 1,
        questionText: "What programming language is used in Flutter?",
        isMultipleChoice: false,
        options: [
          Option(id: 0, text: "Java"),
          Option(id: 1, text: "Dart"),
          Option(id: 2, text: "Kotlin"),
          Option(id: 3, text: "Swift"),
        ],
        correctAnswers: [1],
      ),
      Question(
        id: 2,
        questionText: "Which of the following are state management solutions in Flutter?",
        isMultipleChoice: true,
        options: [
          Option(id: 0, text: "Provider"),
          Option(id: 1, text: "Redux"),
          Option(id: 2, text: "GetX"),
          Option(id: 3, text: "Node.js"),
        ],
        correctAnswers: [0, 2],
      ),
      Question(
        id: 3,
        questionText: "What widget is used for creating an immutable UI?",
        isMultipleChoice: false,
        options: [
          Option(id: 0, text: "StatefulWidget"),
          Option(id: 1, text: "InheritedWidget"),
          Option(id: 2, text: "StreamBuilder"),
          Option(id: 3, text: "StatelessWidget"),
        ],
        correctAnswers: [3],
      ),
      Question(
        id: 4,
        questionText: "What is the purpose of the 'pubspec.yaml' file in Flutter?",
        isMultipleChoice: false,
        options: [
          Option(id: 0, text: "To define app permissions"),
          Option(id: 1, text: "To manage dependencies and project configurations"),
          Option(id: 2, text: "To set the theme of the app"),
          Option(id: 3, text: "To store application state"),
        ],
        correctAnswers: [1],
      ),
    ],
  ),
  QuizResponse(
    quizName: "Flutter State Management",
    description: "Test your knowledge of different state management techniques in Flutter!",
    level: "Intermediate",
    type: "Core",
    time: 60,
    totalAttempted: 2500,
    numberOfQuestions: 10,
    passPercentage: 70,
    modules : ["state","provider","bloc"],
    answers: {
      1: [2],
      2: [0, 1, 2],
      3: [1],
      4: [3],
      5: [1, 3],
      6: [0, 2],
      7: [2],
      8: [3],
      9: [0, 1],
      10: [2],
    },
    questions: [
      Question(
        id: 1,
        questionText: "Which state management solution is built directly into Flutter?",
        isMultipleChoice: false,
        options: [
          Option(id: 0, text: "Redux"),
          Option(id: 1, text: "MobX"),
          Option(id: 2, text: "InheritedWidget"),
          Option(id: 3, text: "Riverpod"),
        ],
        correctAnswers: [2],
      ),
      Question(
        id: 2,
        questionText: "Which of the following are widely used state management solutions in Flutter?",
        isMultipleChoice: true,
        options: [
          Option(id: 0, text: "Provider"),
          Option(id: 1, text: "GetX"),
          Option(id: 2, text: "Bloc"),
          Option(id: 3, text: "Bootstrap"),
        ],
        correctAnswers: [0, 1, 2],
      ),
      Question(
        id: 3,
        questionText: "Which package is recommended by the Flutter team for state management?",
        isMultipleChoice: false,
        options: [
          Option(id: 0, text: "GetX"),
          Option(id: 1, text: "Provider"),
          Option(id: 2, text: "Redux"),
          Option(id: 3, text: "Riverpod"),
        ],
        correctAnswers: [1],
      ),
      Question(
        id: 4,
        questionText: "Which state management solution is based on Streams and Events?",
        isMultipleChoice: false,
        options: [
          Option(id: 0, text: "Provider"),
          Option(id: 1, text: "GetX"),
          Option(id: 2, text: "MobX"),
          Option(id: 3, text: "Bloc"),
        ],
        correctAnswers: [3],
      ),
      Question(
        id: 5,
        questionText: "Which of the following state management solutions uses reactive programming?",
        isMultipleChoice: true,
        options: [
          Option(id: 0, text: "Provider"),
          Option(id: 1, text: "GetX"),
          Option(id: 2, text: "Redux"),
          Option(id: 3, text: "Bloc"),
        ],
        correctAnswers: [1, 3],
      ),
      Question(
        id: 6,
        questionText: "Which state management solutions support dependency injection?",
        isMultipleChoice: true,
        options: [
          Option(id: 0, text: "GetX"),
          Option(id: 1, text: "Redux"),
          Option(id: 2, text: "Riverpod"),
          Option(id: 3, text: "Bloc"),
        ],
        correctAnswers: [0, 2],
      ),
      Question(
        id: 7,
        questionText: "Which Flutter state management solution provides simple observables for reactive programming?",
        isMultipleChoice: false,
        options: [
          Option(id: 0, text: "Redux"),
          Option(id: 1, text: "Bloc"),
          Option(id: 2, text: "MobX"),
          Option(id: 3, text: "Provider"),
        ],
        correctAnswers: [2],
      ),
      Question(
        id: 8,
        questionText: "Which state management approach minimizes widget rebuilds using ValueNotifiers?",
        isMultipleChoice: false,
        options: [
          Option(id: 0, text: "Redux"),
          Option(id: 1, text: "Bloc"),
          Option(id: 2, text: "Riverpod"),
          Option(id: 3, text: "Provider"),
        ],
        correctAnswers: [3],
      ),
      Question(
        id: 9,
        questionText: "Which of the following can be used to manage local app state?",
        isMultipleChoice: true,
        options: [
          Option(id: 0, text: "ChangeNotifier"),
          Option(id: 1, text: "ValueNotifier"),
          Option(id: 2, text: "Firebase Firestore"),
          Option(id: 3, text: "Hive"),
        ],
        correctAnswers: [0, 1],
      ),
      Question(
        id: 10,
        questionText: "Which state management solution is inspired by Redux and uses Actions and Reducers?",
        isMultipleChoice: false,
        options: [
          Option(id: 0, text: "GetX"),
          Option(id: 1, text: "Provider"),
          Option(id: 2, text: "Bloc"),
          Option(id: 3, text: "Riverpod"),
        ],
        correctAnswers: [2],
      ),
    ],
  )
];