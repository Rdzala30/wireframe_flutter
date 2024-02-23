import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'login_signup_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DatabaseHelper dbHelper = DatabaseHelper();

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),
            color: Colors.purple[50],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome' ,
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 26
              ),),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {

                  if (usernameController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    showSnackBar('Username and password cannot be empty.');
                    return;
                  }

                  String username = usernameController.text;
                  String password = passwordController.text;

                  dbHelper.initDatabase();

                  dbHelper.insertUser(username, password);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginSignupScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 48)),
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 16 ,
                  color: Colors.white
                  ),
                ),
              ),

              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginSignupScreen()),
                  );
                },
                child: const Text('Already Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
