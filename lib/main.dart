import 'package:flutter/material.dart';
import 'package:qlvbdh/src/presentations/communication.dart';
import 'package:qlvbdh/src/presentations/personal_task/personal_task_screen.dart';
import 'package:qlvbdh/src/presentations/search_result.dart';
import 'package:qlvbdh/src/presentations/task.dart';
import 'package:qlvbdh/src/presentations/task_forward.dart';
import 'package:qlvbdh/src/presentations/text_details.dart';
import 'package:qlvbdh/src/presentations/text_search.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
      // theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}

