import 'package:flutter/material.dart';
import 'package:qlvbdh/src/components/dropdown/sort_dropdown.dart';
import 'package:qlvbdh/src/components/dropdown/status_dropdown.dart';
import 'package:qlvbdh/src/components/dropdown/task_dropdown.dart';
import 'package:qlvbdh/src/core/theme/app_color.dart';

import '../components/dropdown/status_dropdown_2.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  GlobalKey? actionKey;
  double height = 0, width = 0, xPosition = 0, yPosition = 0;
  bool isDropdownOpened = false;
  OverlayEntry? floatingDropdown;
  String dropdownValue = "Việc của tôi";
  String dropdownValue1 = "";
  String dropdownValue2 = "";
  bool dropDownCallBack = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'CÔNG VIỆC',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,
                size: 26, color: AppColor.skyBlue)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 26, color: AppColor.darkBlue),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 26, color: AppColor.darkBlue),
          ),
        ],
      ),
      body: Stack(
        children: [
          _buildBackground(),
          Column(
            children: [
              ///Toolbar
              _buildToolBar(),

              ///List of content items
              Expanded(
                child: ListView.builder(
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return _buildTask();
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Group 137.png'), fit: BoxFit.fill)),
    );
  }

  Container _buildToolBar() {
    return Container(
      color: Colors.lightBlue.shade100,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      dropdownValue,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        findDropdownPosition();
                        floatingDropdown =
                            _createFloatingDropdown(88.0, 110.0, true, false);
                        Overlay.of(context).insert(floatingDropdown!);
                      });
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColor.skyBlue,
                      size: 26,
                    )),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        findDropdownPosition();
                        floatingDropdown =
                            _createFloatingDropdown(120.0, 110.0, false, true);
                        Overlay.of(context).insert(floatingDropdown!);
                      });
                    },
                    child: const Icon(
                      Icons.filter_alt_sharp,
                      color: Colors.black,
                      size: 24,
                    )),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        findDropdownPosition();
                        floatingDropdown =
                            _createFloatingDropdown(150.0, 110.0, false, false);
                        Overlay.of(context).insert(floatingDropdown!);
                      });
                    },
                    child: const Icon(
                      Icons.sort,
                      color: Colors.black,
                      size: 24,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _buildTask() {
    return Container(
      ///Đường ngăn cách
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey.shade400))),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Column(
          children: [
            RichText(
                text: const TextSpan(
                    text:
                        '[QLVBYKCD&DH] - 45/TB-UBND - Kết luận của Phó Chủ tịch Thường trực UBND tỉnh tại buổi làm việc về Cổng dịch vụ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.black))),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '24/10/2018',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColor.skyBlue),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.chat_bubble_outline,
                      color: AppColor.skyBlue,
                      size: 15,
                    ),
                    Text(' 2', style: TextStyle(fontSize: 13)),
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.attachment_outlined,
                      color: AppColor.skyBlue,
                      size: 18,
                    ),
                    Text(' 1', style: TextStyle(fontSize: 13)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  OverlayEntry _createFloatingDropdown(
      double x, double y, bool checkTasks, bool checkStatus) {
    return OverlayEntry(builder: (context) {
      return Stack(
        children: [
          //For tap outside overlay to dismiss
          Positioned.fill(
              child: GestureDetector(
            onTap: () {
              floatingDropdown?.remove();
              isDropdownOpened = !isDropdownOpened;
            },
            child: Container(
              color: Colors.transparent,
            ),
          )),
          //position of Overlay
          Positioned(
            width: 200.0,
            left: xPosition + x,
            top: yPosition + height + y,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(boxShadow: [
                // Shadow for dropbox
                BoxShadow(
                  blurRadius: 25.0,
                  color: Colors.black,
                  spreadRadius: 0.1,
                  offset: Offset(
                    10,
                    10,
                  ),
                )
              ]),
              child: checkTasks
                  ? TaskDropDown(
                      triggerRemove: hideDropdown,
                      checkIcon: false,
                      itemHeight: height,
                      selectedItem: dropdownValue,
                      callBack: (value) {
                        setState(() {
                          dropdownValue = value;
                          isDropdownOpened = !isDropdownOpened;
                        });
                        floatingDropdown?.remove();
                      },
                    )
                  : checkStatus
                      ? Column(
                          children: [
                            StatusDropDown(
                              triggerRemove: hideDropdown,
                              checkIcon: true,
                              itemHeight: height,
                              selectedItem: dropdownValue2,
                              isSelected: true,
                              callBack: (value) {
                                setState(() {
                                  dropdownValue2 = value;
                                  
                                  // isDropdownOpened = !isDropdownOpened;
                                });
                                // floatingDropdown?.remove();
                              },
                            ),
                            StatusDropDown2(
                              triggerRemove: hideDropdown,
                              checkIcon: true,
                              itemHeight: height,
                              selectedItem: dropdownValue2,
                              callBack: (value) {
                                setState(() {
                                  dropdownValue2 = value;
                                  // isDropdownOpened = !isDropdownOpened;
                                });
                                // floatingDropdown?.remove();
                              },
                            )
                          ],
                        )
                      : SortDropDown(
                          triggerRemove: hideDropdown,
                          checkIcon: true,
                          itemHeight: height,
                          selectedItem1: dropdownValue1,
                          selectedItem2: dropdownValue2,
                          callBack: (value) {
                            setState(() {
                              dropdownValue1 = value;
                              dropdownValue2 = value;
                              isDropdownOpened = !isDropdownOpened;
                            });
                            floatingDropdown?.remove();
                          },
                        ),
            ),
          ),
        ],
      );
    });
  }

  ///Hàm tìm vị trí dropdown
  void findDropdownPosition() {
    ///lấy chiều cao, chiều rộng của dropdown
    RenderBox? renderBox =
        actionKey?.currentContext?.findRenderObject() as RenderBox?;
    height = renderBox?.size.height ?? 0;
    width = renderBox?.size.width ?? 0;

    ///lấy vị trí hiện tại
    Offset? offset = renderBox?.localToGlobal(Offset.zero);
    xPosition = offset?.dx ?? 0;
    yPosition = offset?.dy ?? 0;
    // print(height);
    // print(width);
    // print(xPosition);
    // print(yPosition);
  }

  ///Hàm tắt dropdown
  void hideDropdown() {
    floatingDropdown?.remove();
    isDropdownOpened = !isDropdownOpened;
  }
}
