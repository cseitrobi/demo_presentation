import 'package:demo_blog/feature/landing_screen/presentation/landing_screen.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isButtonEnabled = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    // The Scaffold's body is now wrapped in a SingleChildScrollView
    // to ensure the form is accessible on smaller devices or when the keyboard is visible.
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                key: ValueKey("emailField"), // Finder: byValueKey('emailField')
                controller: emailController,
                onChanged: (value) {
                  setState(() {
                    isEmailValid = isValidEmail(emailController.text);
                    isButtonEnabled = isEmailValid && isPasswordValid;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: isEmailValid ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                key: ValueKey(
                    "passwordField"), // Finder: byValueKey('passwordField')
                controller: passwordController,
                onChanged: (value) {
                  setState(() {
                    isPasswordValid = isValidPassword(passwordController.text);
                    isButtonEnabled = isEmailValid && isPasswordValid;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: isEmailValid ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  key: ValueKey(
                      "loginButton"), // Finder: byValueKey('loginButton')
                  onPressed: isButtonEnabled ? () => _login() : null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    backgroundColor:
                        isButtonEnabled ? Colors.blue : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    // Null or empty check
    if (email.isEmpty) return false;

    // Regular expression for email validation
    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );

    // Check if the email matches the regular expression
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    // You can implement your password validation logic here.
    return password.isNotEmpty && password.length >= 8;
  }

  void _login() {
    // Check if email and password match the specific credentials.
    //Moc login for demo purpose
    if (emailController.text == "xyz@gmail.com" &&
        passwordController.text == "12345678") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LandingPage(),
        ),
      );
    }
  }
}
