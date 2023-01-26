import 'package:flutter/material.dart';
import 'package:reminderappv2/auth/login.dart';
import 'package:reminderappv2/mainscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:reminderappv2/splashscreen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: login(),
      // initialRoute: 'splash',
      // routes: {
      //   'splash': (context) => splashscreen(),
      //   'home': (context) => Mainscreen(),
      // },
    );
  }
}
