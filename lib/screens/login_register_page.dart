import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/home.dart';
import 'package:flutter_todo_app/services/auth.dart';

class LoginRagistePage extends StatefulWidget {
  const LoginRagistePage({super.key});

  @override
  State<LoginRagistePage> createState() => _LoginRagistePageState();
}

class _LoginRagistePageState extends State<LoginRagistePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLogin = true;
  String? errorMessage;

  Future<void> createuser() async {
    try {
      await Auth().createUser(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> userLogin() async {
    try {
      await Auth().userLogin(
          email: emailController.text, password: passwordController.text);
      //print(Auth().currentUser!.uid);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Enter Your E-mail",
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Enter Your Password",
                border: OutlineInputBorder(),
              ),
            ),
            errorMessage != null
                ? Text(errorMessage!)
                : const SizedBox.shrink(),
            ElevatedButton(
                onPressed: () {
                  if (isLogin) {
                    userLogin();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                  } else {
                    createuser();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                  }
                },
                child: isLogin ? const Text("Login") : const Text("Sign Up")),
            GestureDetector(
                onTap: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: isLogin
                    ? Text("Don't have an account yet? Press!")
                    : const Text("Already have an account? Press!")),
          ],
        ),
      ),
    );
  }
}
