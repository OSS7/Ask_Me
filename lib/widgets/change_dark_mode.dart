import 'package:ask_me_app/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeDarkMode extends StatefulWidget {
  const ChangeDarkMode({Key? key}) : super(key: key);

  @override
  State<ChangeDarkMode> createState() => _ChangeDarkModeState();
}

class _ChangeDarkModeState extends State<ChangeDarkMode> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context, listen: true);

    return IconButton(
      onPressed: () {
        setState(() {
          user.setDark();
        });
      },
      icon: Icon(!user.isDark ? Icons.dark_mode : Icons.light_mode),
    );
  }
}
