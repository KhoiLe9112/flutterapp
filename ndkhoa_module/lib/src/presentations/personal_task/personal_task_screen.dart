import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ndkhoa_module/src/components/dropdown/task_dropdown.dart';
import 'package:ndkhoa_module/src/core/theme/app_color.dart';
import 'package:ndkhoa_module/src/router/app_router.dart';

class PersonalTaskScreen extends StatefulWidget {
  const PersonalTaskScreen({super.key});

  @override
  State<PersonalTaskScreen> createState() => _PersonalTaskScreenState();
}

class _PersonalTaskScreenState extends State<PersonalTaskScreen> {
  int total = 350;
  int exchange = 12;
  int unfulfilled = 12;
  int processing = 12;
  int monitor = 12;
  int complete = 12;
  int waiting = 12;
  int opinion = 12;

  ///xác định màn hình cần bind dữ liệu vào
  // GlobalKey? actionKey;
  final actionKey = GlobalKey();
  double height = 0, width = 0, xPosition = 0, yPosition = 0;
  bool isDropdownOpened = false;
  OverlayEntry? floatingDropdown;
  String dropdownValue = "Việc của tôi";
  bool dropDownCallBack = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'CÔNG VIỆC',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,
                size: 30, color: AppColor.skyBlue)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/add_icon.svg',
              width: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/search_icon.svg',
              width: 20,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          _buildBackground(),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _buildToolBar(),
                const SizedBox(
                  height: 10,
                ),
                _buildBox('Trao đổi', exchange, 0xFF00E3EB, () {
                  Get.toNamed(AppRouter.communicationScreen);
                }),
                _buildBox('Chưa thực hiện', unfulfilled, 0xFFFFC400),
                _buildBox('Đang thực hiện', processing, 0xFF007FEB),
                _buildBox('Theo dõi', monitor, 0xFFF388F0),
                _buildBox('Hoàn thành', complete, 0xFF4CA2E8),
                _buildBox('Chờ xác nhận', waiting, 0xFFAA40B9),
                _buildBox('Xin ý kiến ban hành', opinion, 0xFFE34E9E),
                _buildBox('Tất cả', total, 0xFF3550C8, () {
                  Get.toNamed(AppRouter.taskScreen);
                }),
                const SizedBox(
                  height: 15,
                ),
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
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  dropdownValue,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )),
            GestureDetector(
                key: actionKey,
                onTap: () {
                  setState(() {
                    findDropdownPosition();
                    floatingDropdown = _createFloatingDropdown(-2.0, -12.0);
                    Overlay.of(context).insert(floatingDropdown!);
                  });
                },
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColor.skyBlue,
                  size: 30,
                )),
            Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
                child: RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                    text: 'Tổng số ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: total.toString(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ]))),
          ],
        ),
      ),
    );
  }

  Padding _buildBox(String text, int data, int color, [Function()? onTap]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.alarm,
                    size: 28,
                    color: Color(0xFF707070),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(color)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data.toString(),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ///hiển thị dropdown
  OverlayEntry _createFloatingDropdown(double x, double y) {
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
            width: 250.0,
            left: xPosition + x,
            top: yPosition + height + y,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
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
              child: TaskDropDown(
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
              ),
            ),
          ),
        ],
      );
    });
  }

  ///Hàm tìm vị trí dropdown
  void findDropdownPosition() {
    RenderBox renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
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
