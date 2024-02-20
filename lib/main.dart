import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login_page.dart';

void main() {
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 226, 226, 226),
        body: Center(
          child: _isLoading
              ? Lottie.asset(
                  'lottie/teste.json',
                  width: 500,
                  height: 500,
                  repeat: true,
                  reverse: false,
                  animate: true,
                )
              : const LoginPage(),
        ),
      ),
    );
  }
}
