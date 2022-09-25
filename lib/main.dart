import 'package:ask_me_app/constant/constant.dart';
import 'package:ask_me_app/providers/questions.dart';
import 'package:ask_me_app/providers/subjects.dart';
import 'package:ask_me_app/providers/users.dart';
import 'package:ask_me_app/screens/home_screen.dart';
import 'package:ask_me_app/screens/questions_screen.dart';
import 'package:ask_me_app/screens/subjects_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=>Questions(),
        ),
        ChangeNotifierProvider(
          create: (context)=>Users(),
        ),
        ChangeNotifierProvider(
          create: (context)=>Subjects(),
        ),
        // ChangeNotifierProvider(
        //   create: (context)=>Subject(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: secondaryClr
         // primaryColorDark: Colors.black54
          // primarySwatch: Colors.,
        ),
        routes: {
          QuestionsScreen.route:(context)=> const QuestionsScreen(),
          SubjectsScreen.route:(context)=>const SubjectsScreen(),
          HomeScreen.route:(context)=>const HomeScreen(),
        },
        home: const SubjectsScreen(),
      ),
    );
  }
}
