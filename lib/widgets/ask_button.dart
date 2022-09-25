import 'package:ask_me_app/constant/constant.dart';
import 'package:flutter/material.dart';

class AskButton extends StatelessWidget {
  String? txt;
  Function? onPress;
  AskButton({Key? key, this.txt, this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 160,
      height: 170,
      child: MaterialButton(
        color: secondaryClr,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: secondaryClr),
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: onPress!(),
        child: Text(
          txt ?? 'null',
          textAlign: TextAlign.center,
          style: TextStyle(color: secondaryClr),
        ),
      ),
    );
  }
}
