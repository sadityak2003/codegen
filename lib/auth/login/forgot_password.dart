import 'package:codegen/auth/login/verify_otp.dart';
import 'package:codegen/auth/signup_phone/verify_otp_phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'login.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController phoneController = TextEditingController();

  Future<void> submitPhone() async {
    String phone = phoneController.text.trim();

    if (!phone.startsWith('+')) {
      // Ensure the phone number includes the country code.
      phone = '+1' + phone; // Example: prefix with +1 for US numbers.
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message!)));
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ForgotVerifyOTP(verificationId: verificationId),
        ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("CodeGen", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                const SizedBox(height: 50),

                const Text("Forgot Password?", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Text("Remember your password?", style: TextStyle(color: Colors.grey.shade400),),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      child: Text("Login", style: TextStyle(color: Colors.deepPurple.shade400,),),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                Text(
                  "Add Your Country Code eg. +91 ...",
                  style: TextStyle(color: Colors.grey.shade400),
                ),
                // Phone Number TextField
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.call),
                        border: InputBorder.none,
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Send Code Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      backgroundColor: Colors.deepPurple.shade400,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: submitPhone,
                    child: const Text("Send Code", style: TextStyle(fontSize: 15),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
