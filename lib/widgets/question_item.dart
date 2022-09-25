import 'package:ask_me_app/constant/constant.dart';
import 'package:ask_me_app/models/question.dart';
import 'package:ask_me_app/providers/questions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionItem extends StatefulWidget {
  final Question? question;
  const QuestionItem(this.question, {Key? key}) : super(key: key);

  @override
  _QuestionItemState createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  @override
  Widget build(BuildContext context) {
    final que = Provider.of<Questions>(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: widget.question!.isDone == 0 ? errorClr : secondaryClr,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          onLongPress: () {
            que.delete(widget.question!.id ?? 0);
          },
          onTap: () {
            // queF.checkAndUncheck(availableQuestion[i]);
            que.update(widget.question!);
          },
          title: Text(
            '${widget.question!.title}',
            style: TextStyle(
                color: primaryClr, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(
              widget.question!.isDone == 0 ? Icons.close : Icons.check),
        ),
      ),
    );
  }
}
