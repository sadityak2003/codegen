import 'package:codegen/constants/colors.dart';
import 'package:codegen/screens/dashboard/course_screens/banner/android.dart';
import 'package:codegen/screens/dashboard/course_screens/banner/webdev.dart';
import 'package:codegen/screens/dashboard/course_screens/categories/angular.dart';
import 'package:codegen/screens/dashboard/course_screens/categories/java_script.dart';
import 'package:codegen/screens/dashboard/course_screens/categories/rust.dart';
import 'package:codegen/screens/dashboard/course_screens/categories/scala.dart';
import 'package:codegen/screens/dashboard/course_screens/top_courses/cpp_course.dart';
import 'package:codegen/screens/dashboard/course_screens/top_courses/flutter_course.dart';
import 'package:codegen/screens/dashboard/course_screens/top_courses/java_course.dart';
import 'package:codegen/screens/dashboard/course_screens/top_courses/python_course.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();

  List<Course> course = allCourses;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Courses'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'eg: Java',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  )
                ),
                onChanged: searchCourse,
              ),
            ),
        
            Expanded(
              child: ListView.builder(
                itemCount: course.length,
                itemBuilder: (context, index) {
                  final courseT = course[index];
        
                  return ListTile(
                    selectedColor: Colors.deepPurple.shade200,
                    leading: const Icon(Icons.code),
                    title: Text(courseT.title),
                    onTap: () {
                      if (courseT.title == 'Java') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JavaCourse()));
                      }
                      if (courseT.title == 'C++') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CPPCourse()));
                      }
                      if (courseT.title == 'Python') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PythonCourse()));
                      }
                      if (courseT.title == 'Flutter') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FlutterCourse()));
                      }
                      if (courseT.title == 'Java Script') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JavaScriptCourse()));
                      }
                      if (courseT.title == 'HTML') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JavaCourse()));
                      }
                      if (courseT.title == 'CSS') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JavaCourse()));
                      }
                      if (courseT.title == 'Angular') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AngularCourse()));
                      }
                      if (courseT.title == 'Scala') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScalaCourse()));
                      }
                      if (courseT.title == 'Rust') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RustCourse()));
                      }
                      if (courseT.title == 'Git') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JavaCourse()));
                      }
                      if (courseT.title == 'Github') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JavaCourse()));
                      }
                      if (courseT.title == 'DBMS') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const JavaCourse()));
                      }
                      if (courseT.title == 'Android Dev') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AndroidCourse()));
                      }
                      if (courseT.title == 'Web Dev') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WebDevCourse()));
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }


  // Functions

   void searchCourse(String query) {
    final suggestions = allCourses.where((course) {
      final courseT = course.title.toLowerCase();
      final input = query.toLowerCase();

      return courseT.contains(input);
    }).toList();

    setState(() {
      course = suggestions;
    });
   }
}

class Course {
  final String title;

  const Course({required this.title});
}

const allCourses = [
  Course(title: 'Java'),
  Course(title: 'C++'),
  Course(title: 'Python'),
  Course(title: 'Flutter'),
  Course(title: 'Java Script'),
  Course(title: 'HTML'),
  Course(title: 'CSS'),
  Course(title: 'Angular'),
  Course(title: 'Scala'),
  Course(title: 'Rust'),
  Course(title: 'Git'),
  Course(title: 'Github'),
  Course(title: 'DBMS'),
  Course(title: 'Android Dev'),
  Course(title: 'Web Dev'),
];

// class CoursePage extends StatelessWidget {
//   const CoursePage({super.key, required this.course});
//
//   final Course course;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       color: Colors.blue,
//       child: Center(
//       ),
//     );
//   }
// }
//
