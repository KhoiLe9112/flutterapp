import 'package:flutter/material.dart';

class WeeklyCustom extends StatefulWidget {
  const WeeklyCustom({super.key});

  @override
  State<WeeklyCustom> createState() => _WeeklyCustomState();
}

class _WeeklyCustomState extends State<WeeklyCustom> {
  final List<String> listWeekday = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  late DateTime selectedDate;
  late DateTime firstDayOfWeek;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    firstDayOfWeek = selectedDate.weekday != 7
        ? selectedDate.subtract(Duration(days: selectedDate.weekday))
        : selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<Widget>.generate(
          7,
          (index) {
            return GestureDetector(
              onTap: () {
                selectedDate = firstDayOfWeek.add(Duration(days: index));
              },
              child: Container(
                  margin:
                      firstDayOfWeek.add(Duration(days: index)) == selectedDate
                          ? const EdgeInsets.symmetric(horizontal: 8)
                          : EdgeInsets.zero,
                  padding: firstDayOfWeek.add(Duration(days: index)) ==
                          selectedDate
                      ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                      : const EdgeInsets.all(10),
                  decoration:
                      firstDayOfWeek.add(Duration(days: index)) == selectedDate
                          ? BoxDecoration(
                              border: Border.all(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            )
                          : const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${firstDayOfWeek.add(Duration(days: index)).day}",
                        style: firstDayOfWeek.add(Duration(days: index)) ==
                                selectedDate
                            ? const TextStyle(
                                color: Colors.blue,
                                fontSize: 22,
                              )
                            : const TextStyle(
                                fontSize: 20,
                              ),
                      ),
                      Text(
                        listWeekday[firstDayOfWeek
                                    .add(Duration(days: index))
                                    .weekday -
                                1]
                            .substring(0, 2),
                        style: firstDayOfWeek.add(Duration(days: index)) ==
                                selectedDate
                            ? const TextStyle(
                                color: Colors.blue,
                              )
                            : const TextStyle(),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
