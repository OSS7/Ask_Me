import 'package:ask_me_app/constant/constant.dart';
import 'package:ask_me_app/providers/questions.dart';
import 'package:ask_me_app/providers/subjects.dart';
import 'package:ask_me_app/providers/users.dart';
import 'package:ask_me_app/widgets/add_subject.dart';
import 'package:ask_me_app/widgets/change_color.dart';
import 'package:ask_me_app/widgets/change_dark_mode.dart';
import 'package:ask_me_app/widgets/loading_screen.dart';
import 'package:ask_me_app/widgets/subject_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectsScreen extends StatefulWidget {
  static const route = '/SubjectsScreen';

  const SubjectsScreen({Key? key}) : super(key: key);

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Questions>(context, listen: false).index();
    Provider.of<Subjects>(context, listen: false).index();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final subs = Provider.of<Subjects>(context, listen: true);
    final user = Provider.of<Users>(context, listen: true);

    return FutureBuilder(
        future: user.getColors(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const LoadingCircle();
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Sorry, There is Error or there is no messages yet.",
                      style: TextStyle(color: errorClr)),
                );
              }
              if (!snapshot.hasData) {
                return const LoadingCircle();
              } else {
                return Scaffold(
                  backgroundColor: primaryClr,
                  appBar: AppBar(
                    foregroundColor: primaryClr,
                    actions: [
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => SingleChildScrollView(
                                        child: Container(
                                      color: Colors.white12,
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: const AddSubject(),
                                    )));
                          },
                          icon: const Icon(Icons.add)),
                      const ChangeDarkMode(),
                      const ChangeColor(),
                    ],
                    backgroundColor: secondaryClr,
                    title: const Text('Subjects'),
                  ),
                  body: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: subs.items.length,
                    itemBuilder: (ctx, i) {
                      return SubjectItem(
                        subject: subs.items[i],
                      );
                    },
                  ),
                );
              }
          }
        });
  }
}
