import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notebook/view/note_list.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double? deviceWidth;
  double? deviceHeight;

  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(milliseconds: 4500),
        () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return const NoteList();
            })));
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    // CONTROL OF APP ORIENTATION
    if (deviceHeight! < 450 || deviceWidth! < 450) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Text(
                    "Notebook",
                    style: TextStyle(
                        fontFamily: "Anton-Regular",
                        fontSize: 55,
                        color: Color.fromRGBO(10, 10, 10, 0.9)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: LinearProgressIndicator(
                      backgroundColor: Colors.transparent,
                      // strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.blue.shade600,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Text(
                    "Welcome to Notebook App",
                    style: TextStyle(fontSize: 24, color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
