import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuizModel {
  String question;
  List<String> answer;
  num indexOfCorrect;
  QuizModel({
    required this.question,
    required this.answer,
    required this.indexOfCorrect,
  });

  QuizModel copyWith({
    String? question,
    List<String>? answer,
    num? indexOfCorrect,
  }) {
    return QuizModel(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      indexOfCorrect: indexOfCorrect ?? this.indexOfCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answer': answer,
      'indexOfCorrect': indexOfCorrect,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      question: map['question'] as String,
      answer:List.generate(map['answer'].length,(index) => map['answer'][index],),
      indexOfCorrect: map['indexOfCorrect'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuizModel(question: $question, answer: $answer, indexOfCorrect: $indexOfCorrect)';

  @override
  bool operator ==(covariant QuizModel other) {
    if (identical(this, other)) return true;

    return other.question == question &&
        listEquals(other.answer, answer) &&
        other.indexOfCorrect == indexOfCorrect;
  }

  @override
  int get hashCode =>
      question.hashCode ^ answer.hashCode ^ indexOfCorrect.hashCode;
}
