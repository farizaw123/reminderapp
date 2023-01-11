import 'package:flutter/material.dart';
import 'package:reminderappv2/mainscreen.dart';


class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);
  @override
  State<splashscreen> createState() => _splashscreen();
}

class _splashscreen extends State<splashscreen> {

  @override
  void iniState() {
    super.initState();
    openhome();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xF4FAF9F7),
     body: Center(
    child: Image.asset('assets/img/bg-1.png')
     ),
   );
  }

  void openhome() {
    Future.delayed(const Duration(seconds: 3)).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const Mainscreen()));
    });
  }

}


