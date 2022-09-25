import 'package:ask_me_app/constant/constant.dart';
import 'package:ask_me_app/models/subject.dart';
import 'package:ask_me_app/providers/subjects.dart';
import 'package:ask_me_app/screens/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectItem extends StatelessWidget {
  final Subject? subject;
  // final Color color;
  const SubjectItem({Key? key, this.subject}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final sub = Provider.of<Subjects>(context);
    return InkWell(
      onLongPress: (){
        sub.delete(subject?.id??0);
      },
      onTap: () {
        Navigator.of(context).pushNamed(QuestionsScreen.route, arguments: subject);
      },
      child: FittedBox(
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                secondaryClr.withOpacity(0.5),
                secondaryClr,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(subject!.name??'',style: TextStyle(color: primaryClr,fontSize: 20,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
