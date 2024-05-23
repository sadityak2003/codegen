import 'package:codegen/constants/text_strings.dart';
import 'package:flutter/material.dart';

class JavaScriptCourse extends StatelessWidget {
  const JavaScriptCourse({super.key});

  @override
  Widget build(BuildContext context) {

    int currentStep = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HTML',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              leading: const Icon(Icons.start),
              tileColor: Color(0xFFF7F6F1),
              enableFeedback: true,
              title: Text('Basics'),
            ),
          ),
        ),
      )
    );
  }
}
