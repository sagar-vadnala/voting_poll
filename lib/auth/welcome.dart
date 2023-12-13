import 'package:flutter/material.dart';
import 'package:voting_poll/auth/login.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("Voting Poll",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                  },
                   child: Text("Authenticate")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}