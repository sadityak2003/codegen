
import 'package:codegen/auth/signup_phone/signup_phone.dart';
import 'package:codegen/screens/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/login.dart';


class VerifyOTPPhone extends StatefulWidget {
  VerifyOTPPhone({super.key, required this.verificationId});

  String verificationId;

  @override
  State<VerifyOTPPhone> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTPPhone> {

  bool invalidOtp = false;

  TextEditingController otpController = TextEditingController();

  Future<void> submitOTP() async {
    try {
      PhoneAuthCredential credential = await PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otpController.text.toString(),
      );

      FirebaseAuth.instance.signInWithCredential(credential)
          .then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Dashboard())));
    } catch (e) {
      print(e.toString());
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "CodeGen",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),

                const Text(
                  "Verify OTP",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Text(
                      "Already a user?",
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                    TextButton(
                      onPressed: () {

                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.deepPurple.shade400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // OTP  TextField
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: otpController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.call),
                          border: InputBorder.none,
                          hintText: "Enter your otp",
                          hintStyle: TextStyle(color: Colors.grey.shade400)),
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
                    onPressed: submitOTP,
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignUpWithPhone()));
                      },
                      child: const Text("Resend Code",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget myInputBox(BuildContext context, TextEditingController controller) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      //border: Border.all(width: 0),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: Center(
      child: TextField(
        controller: controller,
        maxLength: 1,
        cursorHeight: 40,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        cursorColor: Colors.black,
        style: const TextStyle(fontSize: 24.5),
        decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    ),
  );
}


// Unused Code
/*
 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myInputBox(context, txt1),
                    myInputBox(context, txt2),
                    myInputBox(context, txt3),
                    myInputBox(context, txt4),
                    myInputBox(context, txt5),
                    myInputBox(context, txt6),
                  ],
                ),
 */