import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:codegen/screens/dashboard/dashboard.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../cmmon_widgets/showSnackBar.dart';
import '../../provider/auth/forgot_password.dart';
import '../../provider/auth/login.dart';
import '../signup/signup1.dart';
import '../../cmmon_widgets/custom_container.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    try {
      if (_formKey.currentState!.validate()) {
        final authService = Provider.of<AuthService1>(context, listen: false);
        await authService.signInWithEmail(emailController.text, passwordController.text);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Dashboard()));
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final authService = Provider.of<AuthService1>(context, listen: false);
      await authService.signInWithGoogle();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Dashboard()));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    } catch (e) {
      showSnackBar(context, "An error occurred using Google Sign-In. Try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "CodeGen",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "New here? ",
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpPage1of4()));
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: Colors.deepPurple.shade400),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Email TextField
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: InputBorder.none,
                          hintText: "Email Address",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                        ),
                        validator: validateEmail,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password TextField
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Text(
                                "Forgot?",
                                style: TextStyle(color: Colors.deepPurple.shade400),
                              ),
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                        ),
                        validator: validatePassword,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        backgroundColor: Colors.deepPurple.shade400,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: signIn,
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "OR",
                        style: TextStyle(fontSize: 10, color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Other Login Methods
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Login with Google
                      CustomContainer(width: 330, height: 50, text: "SignIn With Google", icon: FontAwesomeIcons.google, color: Colors.red, onTap: signInWithGoogle),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
