import 'package:ask_me_app/constant/constant.dart';
import 'package:ask_me_app/providers/subjects.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddSubject extends StatefulWidget {
  const AddSubject({Key? key}) : super(key: key);

  @override
  State<AddSubject> createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final subject = Provider.of<Subjects>(context,listen: true);

    return Container(
      decoration: BoxDecoration(
        color: primaryClr,
      ),
      width: size.width*0.2,
      height: size.height*0.5,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: size.height*0.02,
          ),
          Container(
            color: primaryClr,
            width: size.width*0.7,
            height: size.height*0.15,
            child: TextField(
              controller: _controller,
              decoration:  InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryClr, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: secondaryClr, width: 1),
                  ),
                  focusColor: secondaryClr,
                  hintText: 'Subject name',
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
                subject.store(_controller.text.toString());

                Navigator.of(context).pop();
                // db.saveUser(Question(id: 0, title: _controller.text));
              },
              child: const Text(
                'OQO \n Add Subject',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          // AskButton(
          //   txt: "OQO \n Add Subject",
          //   onPress: (){
          //     subject.addQuestion(_controller.text.toString());
          //   },
          // ),
        ],
      ),
    );
  }
}
