import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codegen/screens/dashboard/dashboard.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../cmmon_widgets/showSnackBar.dart';
import '../login/login.dart';
import '../../cmmon_widgets/custom_container.dart';

class SignUpPage1of4 extends StatefulWidget {
  const SignUpPage1of4({Key? key}) : super(key: key);

  @override
  State<SignUpPage1of4> createState() => _SignUpPage1of4State();
}

class _SignUpPage1of4State extends State<SignUpPage1of4> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reenterPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (_formKey.currentState!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      final password = passwordController.text;

      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String hashedPassword = sha256.convert(utf8.encode(password)).toString();

        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'name': name,
          'email': email,
          'password': hashedPassword, // In production, use a secure method.
        });

        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Dashboard()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          showSnackBar(context, 'The provided password is too weak.');
        } else if (e.code == 'email-already-in-use') {
          showSnackBar(context, 'The account already exists for the given email.');
        } else {
          showSnackBar(context, e.message!);
        }
      } catch (e) {
        showSnackBar(context, e.toString());
      }
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser?.authentication;

      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(cred)
          .then((value) => Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const Dashboard())));
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    } catch (e) {
      showSnackBar(context, "An error occurred using Google Sign-In. Try again.");
    }

    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
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

  String? validateReenterPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
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
                  const Text("CodeGen", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),
                  const Text("Welcome!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Already a user?", style: TextStyle(color: Colors.grey.shade400)),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                        },
                        child: Text("Login", style: TextStyle(color: Colors.deepPurple.shade400)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Full Name TextField
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline_outlined),
                          border: InputBorder.none,
                          hintText: "Full Name",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                        ),
                        validator: validateName,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Email TextField
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                        ),
                        validator: validateEmail,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Password
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                        ),
                        validator: validatePassword,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Re-enter Password
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: TextFormField(
                        controller: reenterPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          border: InputBorder.none,
                          hintText: "Re-enter Password",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                        ),
                        validator: validateReenterPassword,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Submit Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            backgroundColor: Colors.deepPurple.shade400,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: signUp,
                          child: const Text("Submit", style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("OR", style: TextStyle(fontSize: 10, color: Colors.grey.shade400)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Login Methods
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Login with Google
                      CustomContainer(width: 330, height: 50, text: "SignIn With Google", icon: FontAwesomeIcons.google, color: Colors.red, onTap: signInWithGoogle),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
// Login with Apple
                      CustomContainer(icon: FontAwesomeIcons.apple, color: Colors.black, onPressed: () {}),

                      // Login with Facebook
                      CustomContainer(icon: FontAwesomeIcons.facebook, color: Colors.blue, onPressed: () {}),
 */