import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ndkhoa_module/src/components/app_button.dart';
import 'package:ndkhoa_module/src/router/app_router.dart';

import '../components/dropdown/more_dropdown.dart';
import '../core/theme/app_color.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final infoKey = GlobalKey();
  double height = 0, xPosition = 0, yPosition = 0;
  bool isDropdownOpened = false;
  OverlayEntry? floatingDropdown;
  String dropdownValue = "";
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
          ///background
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/backgrounds/background1.png'),
                      fit: BoxFit.fill)),
            ),
          ///Content
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _buildToolBar(),
                _buildContent(),
                _buildLine(),
                _buildRoles(),
                _buildLine(),
                _buildDescribe(),
                _buildLine(),
                _buildLink()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildLink() {
    return Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 25.0, bottom: 30.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Hồ sơ / Dự án',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRouter.taskProjectScreen);
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Cổng Dịch vụ công tỉnh Thừa Thiên Huế',
                            style: TextStyle(
                                fontSize: 18, color: AppColor.skyBlue)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRouter.taskProjectScreen);
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'Nâng cấp, tích hợp phần mềm QLVB&ĐH, Ý kiến chỉ đạo',
                            style: TextStyle(
                                fontSize: 18, color: AppColor.skyBlue)),
                      ),
                    ),
                  ],
                ),
              );
  }

  Padding _buildDescribe() {
    return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Ý kiến xử lý\n\n',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        TextSpan(
                            text:
                                'Trung tâm Công nghệ thông tin tỉnh - đơn vị tư vấn xây dựng Cổng dịch vụ công cần tập trung:\n - Hoàn thiện Cổng dịch vụ công trực tuyến đảm bảo đồng bộ, liên thông, an toàn, an ninh hệ thống; tăng cường phối hợp với Trung tâm Hành chính công tỉnh, tổng hợp các góp ý của công dân, tổ chức để hoàn thiện phiên bản Cổng dịch vụ công trực tuyến 1.0 trong quý I.',
                            style: TextStyle(
                                height: 1.4,
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              );
  }

  SingleChildScrollView _buildRoles() {
    return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15.0),
                  child: Row(
                    children: [
                      _buildRole('Người giao', 'assets/avatars/avatar3.png'),
                      const SizedBox(width: 40),
                      _buildRole(
                          'Người thực hiện', 'assets/avatars/avatar1.png'),
                      const SizedBox(width: 40),
                      _buildRole(
                          'Người phối hợp', 'assets/avatars/avatar2.png'),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Column(
                          children: [
                            const Text('(3)',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black)),
                            GestureDetector(
                                onTap: () {},
                                child: const Icon(Icons.more_horiz)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
  }

  Padding _buildContent() {
    return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                child: Column(
                  children: [
                    _buildButtonBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: RichText(
                          text: const TextSpan(
                              text:
                                  '45/TB-UBND - Kết luận của Phó Chủ tịch Thường trực UBND tỉnh tại buổi làm việc về Cổng dịch vụ công trực tuyến vận hành tại Trung tâm Hành chính công tỉnh',
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '24/10/2018',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColor.skyBlue),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.chat_bubble_outline,
                              color: AppColor.skyBlue,
                              size: 20,
                            ),
                            Text(' 2', style: TextStyle(fontSize: 18)),
                            SizedBox(
                              width: 25,
                            ),
                            Icon(
                              Icons.attachment_outlined,
                              color: AppColor.skyBlue,
                              size: 25,
                            ),
                            Text(' 1', style: TextStyle(fontSize: 18)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
  }

  Padding _buildButtonBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          children: [
            Expanded(
                child: AppButton(
                    navigate: () {
                      Get.toNamed(AppRouter.taskForwardScreen);
                    },
                    text: 'Chuyển tiếp',
                    backColor: AppColor.lightBlue,
                    textColor: Colors.white,
                    radius: 16,
                    textSize: 16,
                    horizontal: 10,
                    vertical: 5)),
            const SizedBox(width: 10),
            Expanded(
                child: AppButton(
                    navigate: () {
                      Get.toNamed(AppRouter.taskHandleScreen);
                    },
                    text: 'Xử lý',
                    backColor: AppColor.skyBlue,
                    textColor: Colors.white,
                    radius: 16,
                    textSize: 16,
                    horizontal: 10,
                    vertical: 5)),
            const SizedBox(width: 10),
            Expanded(
                child: AppButton(
                    navigate: () {
                      Get.toNamed(AppRouter.newTaskScreen);
                    },
                    text: 'Chia nhỏ',
                    backColor: AppColor.lightBlue,
                    textColor: Colors.white,
                    radius: 16,
                    textSize: 16,
                    horizontal: 10,
                    vertical: 5)),
          ],
        ));
  }

  Column _buildRole(String role, String avatar) {
    return Column(
      children: [
        Text(
          role,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(avatar),
        ),
      ],
    );
  }

  Container _buildLine() {
    return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey.shade400))));
  }

  Container _buildToolBar() {
    return Container(
      color: Colors.lightBlue.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Chi tiết công việc',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )),
            GestureDetector(
                key: infoKey,
                onTap: () {
                  setState(() {
                    findDropdownPosition(infoKey);
                    floatingDropdown =
                        _createFloatingDropdown(-210.0, -6.0);
                    Overlay.of(context).insert(floatingDropdown!);
                  });
                },
                child: const Icon(
                  Icons.more_vert,
                  color: AppColor.skyBlue,
                  size: 26,
                )),
          ],
        ),
      ),
    );
  }

  OverlayEntry _createFloatingDropdown(
      double x, double y) {
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
                child: MoreDropDown(
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
                )),
          ),
        ],
      );
    });
  }

  void findDropdownPosition(GlobalKey key) {
    RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
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
