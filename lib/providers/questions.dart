import 'dart:math';
import 'package:ask_me_app/models/question.dart';
import 'package:ask_me_app/models/subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Questions with ChangeNotifier {
  Question? randomQuestion;
  int randomId = 0;
  List<Question> items = [];

  Future index() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/questions'));
    if (response.statusCode == 200) {
      items = Question.decode(response.body);
    }
    notifyListeners();
  }

  showRandom(int subId) {
    List<Question> specList = items
        .where((element) => element.subjectId == subId && element.isDone == 0)
        .toList();
    randomId = Random().nextInt(specList.length);

    randomQuestion = specList[randomId];
    notifyListeners();
  }

  store(String title, int subjectId) async {
    final response = await http
        .post(Uri.parse('http://127.0.0.1:8000/api/questions'), body: {
      'user_id': '1',
      'title': title,
      'subject_id': subjectId.toString(),
      'is_done': '0'
    });
    items.add(Question(
        id: items.length + 1, title: title, subjectId: subjectId, isDone: 0));

    notifyListeners();
    //
  }

  update(Question question) async {
    final response = await http.put(
        Uri.parse('http://127.0.0.1:8000/api/questions/${question.id}'),
        body: {
          // 'user_id': '1',
          // 'title': title,
          // 'subject_id': subjectId.toString(),
          'is_done': question.isDone == 0 ? '1' : '0'
        });
    if (question.isDone == 0) {
      question.isDone = 1;
    } else if (question.isDone != 0) {
      question.isDone = 0;
    }

    notifyListeners();
  }

  delete(int id) async {
    final response = await http.delete(
      Uri.parse('http://127.0.0.1:8000/api/questions/$id'),
    );
    items.removeWhere((element) => element.id == id);

    notifyListeners();
  }

  checkAndUncheck(Question question) {
    if (question.isDone == 0) {
      question.isDone = 1;
    } else if (question.isDone != 0) {
      question.isDone = 0;
    }
    notifyListeners();
  }

  List<Question> VerifyId(int ID) {
    return items.where((element) => element.subjectId == ID).toList();
  }
}
