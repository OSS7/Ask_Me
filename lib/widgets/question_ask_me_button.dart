import 'package:ask_me_app/constant/constant.dart';
import 'package:ask_me_app/models/subject.dart';
import 'package:ask_me_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class QuestionAskMeButton extends StatelessWidget {
  final bool couldAsk;
  final Subject subject;
  const QuestionAskMeButton({Key? key, required this.couldAsk, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.2,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: secondaryClr.withOpacity(0.8),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: MaterialButton(
        // shape: const CircleBorder(),
        onPressed: () {
          !couldAsk
              ? null
              : Navigator.of(context)
              .pushNamed(HomeScreen.route, arguments: subject);
        },
        child: Text(
          'Ask Me',
          textAlign: TextAlign.center,
          style: TextStyle(color: primaryClr, fontSize: 16),
        ),
      ),
    );
  }
}
