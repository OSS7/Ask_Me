import 'package:ask_me_app/constant/constant.dart';
import 'package:ask_me_app/models/question.dart';
import 'package:ask_me_app/providers/questions.dart';
import 'package:ask_me_app/models/subject.dart';
import 'package:ask_me_app/screens/home_screen.dart';
import 'package:ask_me_app/screens/subjects_screen.dart';
import 'package:ask_me_app/widgets/add_question.dart';
import 'package:ask_me_app/widgets/question_ask_me_button.dart';
import 'package:ask_me_app/widgets/question_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionsScreen extends StatefulWidget {
  static const route = '/QuestionsScreen';

  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final subArg = ModalRoute.of(context)!.settings.arguments as Subject;
    final queF = Provider.of<Questions>(context, listen: true);
    List<Question> availableQuestion =
        queF.items.where((element) => element.subjectId == subArg.id).toList();
    bool couldAsk = queF.items
            .where((element) =>
                element.subjectId == subArg.id && element.isDone == 0)
            .toList()
            .isEmpty
        ? false
        : true;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryClr,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        foregroundColor: primaryClr,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, SubjectsScreen.route, (route) => false);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: AddQuestion(subArg.id ?? 1),
                        ),
                      ));
            },
          )
        ],
        backgroundColor: secondaryClr,
        elevation: 0.0,
        title: Text(subArg.name.toString()),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: availableQuestion.length,
                  itemBuilder: (context, i) {
                    return QuestionItem(availableQuestion[i]);
                  }),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: QuestionAskMeButton(
                couldAsk: couldAsk,
                subject: subArg,
              )),
        ],
      ),
    );
  }
}
