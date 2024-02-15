import 'package:flutter/material.dart';
import './signup_page.dart';
import './home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = 'es553807@gmail.com';
  final password = '123456';

  String emailInput = '';
  String passwordInput = '';

  bool emailError = false;
  bool passwordError = false;

  void validationUserLogin(email, password) {
    if (email == emailInput.trim() && password == passwordInput.trim()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      setState(() {
        emailError = email != emailInput.trim();
        passwordError = password != passwordInput.trim();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 118,
                height: 118,
                child: Image.asset("img/logo-removebg-preview.png"),
              ),
              TextField(
                onChanged: (value) => {
                  setState(() {
                    emailInput = value;
                    emailError = false;
                  })
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorText: emailError ? 'Email incorreto' : null,
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                onChanged: (value) => {
                  setState(() {
                    passwordInput = value;
                    passwordError = false;
                  })
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorText: passwordError ? 'Senha incorreta' : null,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  validationUserLogin(email, password);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: const Text(
                  'Não tem cadastro? Cadastre-se',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
