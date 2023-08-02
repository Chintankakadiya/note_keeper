import 'package:flutter/material.dart';
import 'package:note_keeper/utils/colours.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  initTime() async {
    await Future.delayed(Duration(microseconds: 5), () {});
  }

  @override
  void initState() {
    // TODO: implement initState
    initTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/note_keper_logo.png',
              height: 150,
              width: 150,
            ),
            Text(
              "Note Keeper App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
