// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:untitled/auth/login/login.dart';
//
// class OTPPage extends StatefulWidget {
//   const OTPPage({Key? key}) : super(key: key);
//
//   @override
//   State<OTPPage> createState() => _OTPPageState();
// }
//
// class _OTPPageState extends State<OTPPage> {
//   bool invalidOtp = false;
//   //int resendTime = 60;
//   //late Timer countdownTimer;
//   TextEditingController txt1 = TextEditingController();
//   TextEditingController txt2 = TextEditingController();
//   TextEditingController txt3 = TextEditingController();
//   TextEditingController txt4 = TextEditingController();
//
//   // @override
//   // void initState() {
//   //   startTimer();
//   //   super.initState();
//   // }
//
//   // startTimer() {
//   //   countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//   //     setState(() {
//   //       resendTime = resendTime - 1;
//   //     });
//   //     if (resendTime < 1) {
//   //       countdownTimer.cancel();
//   //     }
//   //   });
//   // }
//
//   // stopTimer() {
//   //   if (countdownTimer.isActive) {
//   //     countdownTimer.cancel();
//   //   }
//   // }
//
//   String strFormatting(n) => n.toString().padLeft(2, '0');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 const Text(
//                   'Verification Code',
//                   style: TextStyle(fontSize: 30),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Enter the 4 digit verification code received',
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     myInputBox(context, txt1),
//                     myInputBox(context, txt2),
//                     myInputBox(context, txt3),
//                     myInputBox(context, txt4),
//                   ],
//                 ),
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "Haven't received OTP yet?",
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     const SizedBox(width: 10),
//                     resendTime == 0
//                         ? InkWell(
//                       onTap: () {
//                         // Resend OTP Code
//                         invalidOtp = false;
//                         resendTime = 60;
//                         startTimer();
//                         //
//                       },
//                       child: const Text(
//                         'Resend',
//                         style: TextStyle(color: Colors.red, fontSize: 18),
//                       ),
//                     )
//                         : const SizedBox()
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 resendTime != 0
//                     ? Text(
//                   'You can resend OTP after ${strFormatting(resendTime)} second(s)',
//                   style: const TextStyle(fontSize: 18),
//                 )
//                     : const SizedBox(),
//                 const SizedBox(height: 5),
//                 Text(
//                   invalidOtp ? 'Invalid otp!' : '',
//                   style: const TextStyle(fontSize: 20, color: Colors.red),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     //
//                     final otp = txt1.text + txt2.text + txt3.text + txt4.text;
//                     if (otp == '1989') {
//                       // Go to welcome
//                       //stopTimer();
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (context) => const LoginPage(),
//                         ),
//                       );
//                     } else {
//                       setState(() {
//                         invalidOtp = true;
//                       });
//                     }
//                     //
//                   },
//                   child: const Text(
//                     'Verify',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size.fromHeight(50),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Widget myInputBox(BuildContext context, TextEditingController controller) {
//   return Container(
//     height: 70,
//     width: 60,
//     decoration: BoxDecoration(
//       border: Border.all(width: 1),
//       borderRadius: const BorderRadius.all(
//         Radius.circular(20),
//       ),
//     ),
//     child: TextField(
//       controller: controller,
//       maxLength: 1,
//       textAlign: TextAlign.center,
//       keyboardType: TextInputType.number,
//       style: const TextStyle(fontSize: 42),
//       decoration: const InputDecoration(
//         counterText: '',
//       ),
//       onChanged: (value) {
//         if (value.length == 1) {
//           FocusScope.of(context).nextFocus();
//         }
//       },
//     ),
//   );
// }