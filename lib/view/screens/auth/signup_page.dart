import 'package:flutter/material.dart';

import '../../widgets/auth/SignUpForm.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 100,
                height: 150,
              ),
              Text(
                "Create a new account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              SignUpForm()
            ],
          ),
        ),
      ),
    );
  }
}
