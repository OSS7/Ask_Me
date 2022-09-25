import 'package:ask_me_app/constant/constant.dart';
import 'package:ask_me_app/providers/questions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeShowDialog extends StatelessWidget {
  const HomeShowDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question = Provider.of<Questions>(context, listen: true);

    return Container(
      height: size.height * 0.18,
      width: size.width * 0.99,
      margin: const EdgeInsets.only(left: 40),
      decoration: BoxDecoration(
          borderRadius:
          const BorderRadius.all(Radius.circular(20)),
          color: primaryClr,
          border:
          Border.all(color: secondaryClr, width: 6)),
      child: Center(
        child: Text(
          "The Question is \n \n ${question.randomQuestion?.title}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: secondaryClr
            // color: question.items[question.ID].color
          ),
        ),
      ),
    );
  }
}
