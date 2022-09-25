import 'package:ask_me_app/constant/constant.dart';
import 'package:ask_me_app/models/subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Subjects with ChangeNotifier {
  List<Subject> items = [];

  Future index() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/subjects'));
    if (response.statusCode == 200) {
      items = Subject.decode(response.body);
    }
    notifyListeners();
  }

  store(String title) async {
    await http.post(Uri.parse('http://127.0.0.1:8000/api/subjects'),
        body: {'user_id': '1', 'name': title});
    items.add(Subject(id: items.length + 1, name: title));
    notifyListeners();
  }

  delete(int id) async {
    await http.delete(
      Uri.parse('http://127.0.0.1:8000/api/subjects/$id'),
    );
    items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
