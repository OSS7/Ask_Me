import 'package:ask_me_app/constant/constant.dart';
import 'package:flutter/material.dart';

class HomeTopContainer extends StatelessWidget {
  const HomeTopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.30,
      decoration: BoxDecoration(
        color: secondaryClr,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.elliptical(190, 180),
        ),
      ),
    );
  }
}
