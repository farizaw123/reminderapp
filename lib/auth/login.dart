import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reminderappv2/mainscreen.dart';


class login extends StatefulWidget {

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  bool hide = false;
  bool check = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        children: [
          Image.asset('assets/img/bg-1.png', height: 200,),
          SizedBox(height: 10,),
          Text("School's Reminder", style: TextStyle(color: Colors.redAccent, fontSize: 18), textAlign: TextAlign.center,),
          SizedBox(height: 50,),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xadadadad)),
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.grey.shade300)
              ),
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(right: 10, left: 40, top: 5, bottom: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xadadadad)),
                borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: passwordController,
              obscureText: hide,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey.shade300),
                  suffixIcon: IconButton(
                    icon: hide == true ? Icon(CupertinoIcons.eye_slash, color: Colors.grey.shade300,) : Icon(CupertinoIcons.eye, color: Colors.grey.shade300,),
                    onPressed: (){
                      setState(() {
                        hide = !hide;
                      });
                    },
                  )
              ),
            ),
          ),
          Row(
            children: [
              Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.redAccent,
                  value: this.check,
                  onChanged: (bool? check){
                    setState(() {
                      this.check = check!;
                    });
                  }
              ),
              SizedBox(width: 5,),
              Text("Ingat Email & Password Saya", style: TextStyle(color: Colors.grey.shade300),)
            ],
          ),
          SizedBox(height: 30,),
          Text("SignUp With", textAlign: TextAlign.center, style: TextStyle(color: Colors.redAccent),),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 40,
                height: 40,
                color: Colors.grey,
              ),
              Container(
                width: 40,
                height: 40,
                color: Colors.grey,
              ),
              Container(
                width: 40,
                height: 40,
                color: Colors.grey,
              )
            ],
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Mainscreen()));
              },
              child: Text("Masuk"),
            ),
          )
        ],
      ),
    );
  }

}