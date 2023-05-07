import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qlvbdh/src/components/dropdown/sort_dropdown.dart';
import 'package:qlvbdh/src/components/dropdown/status_dropdown.dart';
import 'package:qlvbdh/src/components/dropdown/task_dropdown.dart';
import 'package:qlvbdh/src/core/theme/app_color.dart';

import '../components/dropdown/sort_dropdown_2.dart';
import '../components/dropdown/status_dropdown_2.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  // GlobalKey? actionKey;
  final taskActionKey = GlobalKey();
  final statusActionKey = GlobalKey();
  final sortActionKey = GlobalKey();
  double height = 0, xPosition = 0, yPosition = 0;
  bool isDropdownOpened = false;
  OverlayEntry? floatingDropdown;
  String dropdownValue = "Việc của tôi";
  String statusDropdownValue1 = "";
  String statusDropdownValue2 = "";
  String sortDropdownValue1 = "";
  String sortDropdownValue2 = "";
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
            icon: SvgPicture.asset(
              'assets/icons/add_icon.svg',
              width: 16,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/search_icon.svg',
              width: 16,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          _buildBackground(),
          SingleChildScrollView(
            child: Column(
              children: [
                ///Toolbar
                _buildToolBar(),
                ///List of content items
                ListView.builder(
                    ///Tat scroll cua listview
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return _buildTask();
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/backgrounds/background1.png'),
              fit: BoxFit.fill)),
    );
  }

  Container _buildToolBar() {
    return Container(
      color: Colors.lightBlue.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      dropdownValue,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )),
                GestureDetector(
                    key: taskActionKey,
                    onTap: () {
                      setState(() {
                        findDropdownPosition(taskActionKey);
                        floatingDropdown =
                            _createFloatingDropdown(-5.0, -12.0, true, false);
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
                    key: statusActionKey,
                    onTap: () {
                      setState(() {
                        findDropdownPosition(statusActionKey);
                        floatingDropdown =
                            _createFloatingDropdown(-170.0, -6.0, false, true);
                        Overlay.of(context).insert(floatingDropdown!);
                      });
                    },
                    child: const Icon(
                      Icons.filter_alt_sharp,
                      color: Colors.black,
                      size: 24,
                    )),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  key: sortActionKey,
                  onTap: () {
                    setState(() {
                      findDropdownPosition(sortActionKey);
                      floatingDropdown =
                          _createFloatingDropdown(-160.0, -6.0, false, false);
                      Overlay.of(context).insert(floatingDropdown!);
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/icons/sort_icon.svg',
                    width: 24,
                  ),
                ),
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
                                selectedItem: statusDropdownValue1,
                                callBack: (value) {
                                  setState(() {
                                    statusDropdownValue1 = value;
                                  });
                                },
                              ),
                              StatusDropDown2(
                                triggerRemove: hideDropdown,
                                checkIcon: true,
                                itemHeight: height,
                                selectedItem: statusDropdownValue2,
                                callBack: (value) {
                                  setState(() {
                                    statusDropdownValue2 = value;
                                  });
                                },
                              )
                            ],
                          )
                        : Column(
                            children: [
                              SortDropDown(
                                triggerRemove: hideDropdown,
                                checkIcon: true,
                                itemHeight: height,
                                selectedItem: sortDropdownValue1,
                                callBack: (value) {
                                  setState(() {
                                    sortDropdownValue1 = value;
                                  });
                                },
                              ),
                              SortDropDown2(
                                triggerRemove: hideDropdown,
                                checkIcon: true,
                                itemHeight: height,
                                selectedItem: sortDropdownValue2,
                                callBack: (value) {
                                  setState(() {
                                    sortDropdownValue2 = value;
                                  });
                                },
                              )
                            ],
                          )),
          ),
        ],
      );
    });
  }

  ///Hàm tìm vị trí dropdown
  void findDropdownPosition(GlobalKey key) {
    RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
      height = renderBox.size.height;
    Offset position = renderBox.localToGlobal(Offset.zero);
      xPosition = position.dx;
      yPosition = position.dy;
  }

  ///Hàm tắt dropdown
  void hideDropdown() {
    floatingDropdown?.remove();
    isDropdownOpened = !isDropdownOpened;
  }
}
