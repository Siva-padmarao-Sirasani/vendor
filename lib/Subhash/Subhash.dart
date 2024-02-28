import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/Configurations/AppColors.dart';
import 'package:untitled/Configurations/AppStyles.dart';
import 'package:untitled/Configurations/AssetStrings.dart';
import 'package:untitled/Subhash/SubhashHome.dart';

class Subhash extends StatefulWidget {
  const Subhash({super.key});

  @override
  State<Subhash> createState() => _SubhashState();
}

class _SubhashState extends State<Subhash> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              const Center(
                child: Text(
                  "Stationary Essentials",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Center(
                child: Image(
                  image: AssetImage(AppImages.sta),
                  height: 250.0,
                ),
              ),
              Text("LogIn", style: AppStyles.boldText()),
              const SizedBox(height: 15.0),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25.0),
              // Button with full-width
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 45.0,
                child: ElevatedButton(
                  onPressed: () async {
                    // Validate and log in
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();

                    try {
                      UserCredential userCredential =
                      await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context)=>const SubhashHome()),
                      );

                      // Handle successful login
                      debugPrint('User logged in: ${userCredential.user}');
                    } catch (e) {
                      // Handle login failure
                      debugPrint('Login failed: $e');
                      // You can display an error message to the user here
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColor, // Use your primary color
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 16, color: AppColors.whiteColor),
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
