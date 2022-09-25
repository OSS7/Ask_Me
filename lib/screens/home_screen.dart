import 'package:ask_me_app/constant/constant.dart';
import 'package:ask_me_app/providers/questions.dart';
import 'package:ask_me_app/models/subject.dart';
import 'package:ask_me_app/widgets/home_ask_button.dart';
import 'package:ask_me_app/widgets/home_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final question = Provider.of<Questions>(context, listen: true);
    final subArg = ModalRoute.of(context)!.settings.arguments as Subject;

    return Scaffold(
      backgroundColor: primaryClr,
      appBar: AppBar(
        foregroundColor: primaryClr,
        backgroundColor: secondaryClr,
        title: const Text('Ask Screen'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: size.height * 0.43,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: size.height * 0.30,
                      decoration: BoxDecoration(
                        color: secondaryClr,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.elliptical(190, 180),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      height: size.height * 0.3,
                      width: size.width * 0.9,
                      child: const HomeShowDialog(),
                    ),
                  ],
                ),
              ),
            ),
            HomeAskButton(subject: subArg),
          ],
        ),
      ),
    );
  }
}
