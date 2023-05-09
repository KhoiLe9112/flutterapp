import 'package:get/get.dart';
import 'package:ndkhoa_module/src/presentations/child_task.dart';
import 'package:ndkhoa_module/src/presentations/communication.dart';
import 'package:ndkhoa_module/src/presentations/communication1.dart';
import 'package:ndkhoa_module/src/presentations/enter_comments.dart';
import 'package:ndkhoa_module/src/presentations/home/bindings/home_bindings.dart';
import 'package:ndkhoa_module/src/presentations/incoming_text/bindings/incoming_text_bindings.dart';
import 'package:ndkhoa_module/src/presentations/home/home_screen.dart';
import 'package:ndkhoa_module/src/presentations/incoming_text/incoming_text_screen.dart';
import 'package:ndkhoa_module/src/presentations/personal_task/personal_task_screen.dart';
import 'package:ndkhoa_module/src/presentations/search_result.dart';
import 'package:ndkhoa_module/src/presentations/statistics/bindings/all_incoming_text_bindings.dart';
import 'package:ndkhoa_module/src/presentations/statistics/bindings/statistics_bindings.dart';
import 'package:ndkhoa_module/src/presentations/statistics/statistics_screen.dart';
import 'package:ndkhoa_module/src/presentations/statistics/all_incoming_text_screen.dart';
import 'package:ndkhoa_module/src/presentations/statistics/statistics2_screen.dart';
import 'package:ndkhoa_module/src/presentations/task.dart';
import 'package:ndkhoa_module/src/presentations/task_details.dart';
import 'package:ndkhoa_module/src/presentations/task_forward.dart';
import 'package:ndkhoa_module/src/presentations/task_project.dart';
import 'package:ndkhoa_module/src/presentations/tasks/bindings/new_task_bindings.dart';
import 'package:ndkhoa_module/src/presentations/tasks/new_task_screen.dart';
import 'package:ndkhoa_module/src/presentations/text_details.dart';
import 'package:ndkhoa_module/src/presentations/text_search.dart';

class AppRouter {
  static const homeScreen = "/home";
  static const incomingTextScreen = "/incoming-text";
  static const statisticsScreen = "/statistics";
  static const statistics2Screen = "/statistics2";
  static const allIncomingTextScreen = "/all-incoming-text";
  static const newTaskScreen = "/new-task";
  static const taskScreen = "/task";
  static const personalTaskScreen = "/task-personal";
  static const taskProjectScreen = "/task-project";
  static const taskDetailsScreen = "/task-details";
  static const taskForwardScreen = "/task-forward";
  static const childTask = "/task-child";
  static const communicationScreen = "/communication";
  static const communication1Screen = "/communication1";
  static const enterCommentsScreen = "/enter-comments";
  static const searchResultScreen = "/search-result";
  static const textDetailsScreen = "/text-details";
  static const textSearchScreen = "/text-Search";
  static List<GetPage> pages = [
    GetPage(name: homeScreen, page: () => HomeScreen(), bindings: [
      HomeBindings(),
    ]),
    GetPage(name: incomingTextScreen, page: () => const IncomingTextScreen(), bindings: [
      IncomingTextBindings(),
    ]),
    GetPage(name: statisticsScreen, page: () => const StatisticsScreen(), bindings: [
      StatisticsBindings(),
    ]),
    GetPage(name: statistics2Screen, page: () => const Statistics2Screen()),
    GetPage(name: allIncomingTextScreen, page: () => const AllIncomingTextScreen(), bindings: [
      AllIncomingTextBindings(),
    ]),
    GetPage(name: newTaskScreen, page: () => const NewTaskScreen(), bindings: [
      NewTaskBindings(),
    ]),
    GetPage(name: taskScreen, page: () => const TaskScreen()),
    GetPage(name: personalTaskScreen, page: () => const PersonalTaskScreen()),
    GetPage(name: taskProjectScreen, page: () => const TaskProjectScreen()),
    GetPage(name: taskForwardScreen, page: () => const TaskForwardScreen()),
    GetPage(name: taskDetailsScreen, page: () => const TaskDetailsScreen()),
    GetPage(name: childTask, page: () => const ChildTask()),
    GetPage(name: communicationScreen, page: () => const CommunicationScreen()),
    GetPage(name: communication1Screen, page: () => const Communication1Screen()),
    GetPage(name: enterCommentsScreen, page: () => const EnterCommentsScreen()),
    GetPage(name: searchResultScreen, page: () => const SearchResultScreen()),
    GetPage(name: textDetailsScreen, page: () => const TextDetailsScreen()),
    GetPage(name: textSearchScreen, page: () => const TextSearchScreen()),
  ];
}