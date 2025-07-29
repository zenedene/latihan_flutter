import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:latihan1/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String statusLogin = "Please login to continue";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to our app!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Please log in to continue."),
            Center(
              child: Image.asset(
                'assets/images/arjijiji.png',
                width: 100,
                height: 100,
              ),
            ),

            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String username = "admin";
                  String password = "123";

                  if (_usernameController.text == username &&
                      _passwordController.text == password) {
                    setState(() {
                      statusLogin = "Login Successful! 🎉";
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  } else {
                    setState(() {
                      statusLogin = "Login Failed! Please try again.";
                    });
                  }
                },
                child: const Text('Login'),
              ),
            ),
            Text(statusLogin),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },

                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
