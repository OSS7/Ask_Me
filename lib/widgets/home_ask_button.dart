import 'package:ask_me_app/constant/constant.dart';
import 'package:ask_me_app/models/subject.dart';
import 'package:ask_me_app/providers/questions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAskButton extends StatelessWidget {
  final Subject subject;
  const HomeAskButton({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final question = Provider.of<Questions>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: secondaryClr),
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          question.showRandom(subject.id ?? 1);
        },
        child: Container(
          margin: const EdgeInsets.all(20),
          width: 160,
          height: 170,
          child: Center(
            child: Text(
              "OQO \n Ask Me Question",
              textAlign: TextAlign.center,
              style: TextStyle(color: secondaryClr),
            ),
          ),
        ),
      ),
    );
  }
}
