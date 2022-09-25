import 'package:ask_me_app/constant/constant.dart';
import 'package:ask_me_app/models/question.dart';
import 'package:ask_me_app/providers/questions.dart';
import 'package:ask_me_app/widgets/ask_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddQuestion extends StatelessWidget {
  final int subjectId;
  AddQuestion(this.subjectId, {Key? key}) : super(key: key);

  final TextEditingController _title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question = Provider.of<Questions>(context);

    return SingleChildScrollView(
      child: Container(
        color: primaryClr,
        child: Container(
          decoration:  BoxDecoration(
            color: primaryClr,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          width: size.width * 0.2,
          height: size.height * 0.5,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                color: primaryClr,
                width: size.width * 0.7,
                height: size.height * 0.15,
                child: TextField(
                  style: TextStyle(
                    fontSize: 18,
                    color: secondaryClr
                  ),
                  controller: _title,
                  decoration:  InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: secondaryClr, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: secondaryClr, width: 1),
                    ),
                    focusColor: secondaryClr,
                    hintText: 'Question',
                    hintStyle: TextStyle(
                      color: secondaryClr,
                    )
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: 160,
                height: 100,
                child: MaterialButton(
                  color: secondaryClr,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: secondaryClr),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  onPressed:(){
                    question.store(_title.text,subjectId);

                    Navigator.of(context).pop();
                    // db.saveUser(Question(id: 0, title: _controller.text));
                  },
                  child:  Text(
                    'OQO \n Add Question',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: primaryClr),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
