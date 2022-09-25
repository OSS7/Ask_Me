import 'package:ask_me_app/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeColor extends StatefulWidget {
  const ChangeColor({Key? key}) : super(key: key);

  @override
  State<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context, listen: true);

    return IconButton(
      onPressed: () {
        setState(() {
          user.setColor();
        });
      },
      icon: Icon(
        Icons.circle,
        color: !user.isBlue ? const Color(0xff2e7d32) : const Color(0xff283593),
      ),
    );
  }
}
