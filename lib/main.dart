import 'package:flutter/material.dart';
import 'package:qlvbdh/src/presentations/child_task.dart';
import 'package:qlvbdh/src/presentations/communication.dart';
import 'package:qlvbdh/src/presentations/communication1.dart';
import 'package:qlvbdh/src/presentations/enter_comments.dart';
import 'package:qlvbdh/src/presentations/personal_task/personal_task_screen.dart';
import 'package:qlvbdh/src/presentations/search_result.dart';
import 'package:qlvbdh/src/presentations/task.dart';
import 'package:qlvbdh/src/presentations/task_details.dart';
import 'package:qlvbdh/src/presentations/task_forward.dart';
import 'package:qlvbdh/src/presentations/task_project.dart';
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
      initialRoute: '/textsearch',
      routes: {
        '/textsearch': (context) => const TextSearchScreen(),
        '/searchresult': (context) => const SearchResultScreen(),
        '/personaltask': (context) => const PersonalTaskScreen(),
        '/childtask': (context) => const ChildTask(),
        '/communication': (context) => const CommunicationScreen(),
        '/communication1': (context) => const Communication1Screen(),
        '/entercomments': (context) => const EnterCommentsScreen(),
        '/taskdetails': (context) => const TaskDetailsScreen(),
        '/taskfoward': (context) => const TaskForwardScreen(),
        '/taskproject': (context) => const TaskProjectScreen(),
        '/task': (context) => const TaskScreen(),
        '/textdetails': (context) => const TextDetailsScreen(),
      },
      // theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}

