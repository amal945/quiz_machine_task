class QuizResponse {
  final String quizName;
  final String description;
  final String type;
  final String level;
  final int time; // In minutes
  final int totalAttempted;
  final int numberOfQuestions;
  final double passPercentage;
  final List<String> modules;
  final List<Question> questions;
  final Map<int, List<int>> answers;

  QuizResponse({
    required this.quizName,
    required this.description,
    required this.time,
    required this.totalAttempted,
    required this.numberOfQuestions,
    required this.passPercentage,
    required this.modules,
    required this.questions,
    required this.answers,
    required this.level,
    required this.type,
  });

  factory QuizResponse.fromJson(Map<String, dynamic> json) {
    return QuizResponse(
      type: json["type"],
      level: json["level"],
      quizName: json['quizName'],
      description: json['description'],
      time: json['time'],
      totalAttempted: json['totalAttempted'],
      numberOfQuestions: json['numOfQuestions'], // Match JSON key
      passPercentage: (json['passPercentage'] as num).toDouble(),
      modules: List<String>.from(json['modules']),
      questions: (json['questions'] as List)
          .asMap()
          .entries
          .map((entry) => Question.fromJson(entry.key + 1, entry.value))
          .toList(),
      answers: Map<int, List<int>>.from(
        json['answers'].map((key, value) => MapEntry(int.parse(key), List<int>.from(value))),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'quizName': quizName,
      'description': description,
      "level": level,
      'time': time,
      'totalAttempted': totalAttempted,
      'numberOfQuestions': numberOfQuestions,
      'passPercentage': passPercentage,
      'modules': modules,
      'questions': questions.map((q) => q.toJson()).toList(),
      'answers': answers.map((key, value) => MapEntry(key.toString(), value)),
    };
  }
}

class Question {
  final int id;
  final String questionText;
  final bool isMultipleChoice;
  final List<Option> options;
  final List<int> correctAnswers;

  Question({
    required this.id,
    required this.questionText,
    required this.isMultipleChoice,
    required this.options,
    required this.correctAnswers,
  });

  factory Question.fromJson(int id, Map<String, dynamic> json) {
    return Question(
      id: id,
      questionText: json['questionText'],
      isMultipleChoice: json['questionType'] == "multiple",
      options: (json['options'] as List)
          .asMap()
          .entries
          .map((entry) => Option(id: entry.key, text: entry.value))
          .toList(),
      correctAnswers: List<int>.from(json['correctAnswers']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionText': questionText,
      'isMultipleChoice': isMultipleChoice,
      'options': options.map((o) => o.toJson()).toList(),
      'correctAnswers': correctAnswers,
    };
  }
}

class Option {
  final int id;
  final String text;

  Option({required this.id, required this.text});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
    };
  }
}
