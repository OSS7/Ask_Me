import 'dart:convert';

import 'package:ask_me_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Subject with ChangeNotifier {
  final int? id;
  final String? name;
  Subject({this.id, this.name});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      name: json['name'],
    );
  }

  static Map<String, dynamic>? toMap(Subject question) => {
        'id': question.id,
        'name': question.name,
      };

  static String encode(List<Subject> question) =>
      json.encode(question.map((e) => Subject.toMap(e)).toList());

  static List<Subject> decode(String question) =>
      (json.decode(question) as List<dynamic>)
          .map<Subject>((item) => Subject.fromJson(item))
          .toList();
}
