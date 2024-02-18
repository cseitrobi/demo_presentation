import 'package:demo_blog/feature/dashboard/presentation/dashboard.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                onChanged: (value) {},
                decoration: InputDecoration(
                    label: Text("Email"), hintText: "Enter your email"),
              ),
              TextField(
                controller: passwordController,
                onChanged: (value) {},
                obscureText: true,
                decoration: InputDecoration(
                    label: Text("Password"), hintText: "Enter your password"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Dashboard(),
                      ),
                    );
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
