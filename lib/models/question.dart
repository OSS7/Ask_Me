import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Question {
  int? id;
  String? title;
  int? subjectId;
  int? isDone;
  Question(
      {@required this.id, @required this.title, this.subjectId, this.isDone});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      title: json['title'],
      subjectId: json['subject_id'],
      isDone: json['is_done'],
    );
  }

  static Map<String, dynamic>? toMap(Question question) => {
        'id': question.id,
        'subject_id': question.subjectId,
        'title': question.title,
        'is_done': question.isDone,
      };

  static String encode(List<Question> question) =>
      json.encode(question.map((e) => Question.toMap(e)).toList());

  static List<Question> decode(String question) =>
      (json.decode(question) as List<dynamic>)
          .map<Question>((item) => Question.fromJson(item))
          .toList();
}
