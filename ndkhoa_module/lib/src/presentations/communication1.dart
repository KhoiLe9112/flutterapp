import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ndkhoa_module/src/router/app_router.dart';

import '../core/theme/app_color.dart';

class Communication1Screen extends StatefulWidget {
  const Communication1Screen({super.key});

  @override
  State<Communication1Screen> createState() => _Communication1ScreenState();
}

class _Communication1ScreenState extends State<Communication1Screen> {
  final actionKey1 = GlobalKey();
  final actionKey2 = GlobalKey();
  final actionKey3 = GlobalKey();
  final actionKey4 = GlobalKey();
  final actionKey5 = GlobalKey();
  double height = 0, xPosition = 0, yPosition = 0;
  OverlayEntry? floatingNote;
  bool isNoteDisplay = false;

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
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _buildToolBar(),
                _buildCommunication(context, 'assets/avatars/avatar2.png',
                    'Nguyễn Văn Tình', actionKey1),
                _buildCommunication(context, 'assets/avatars/avatar1.png',
                    'Lê Quốc Thịnh', actionKey2),
                _buildCommunication(context, 'assets/avatars/avatar2.png',
                    'Nguyễn Văn Tình', actionKey3),
                _buildCommunication(context, 'assets/avatars/avatar3.png',
                    'Lê Vĩnh Chiến', actionKey4),
                _buildCommunication(context, 'assets/avatars/avatar2.png',
                    'Nguyễn Văn Tình', actionKey5),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _buildCommunication(
      BuildContext context, String avatar, String fullname, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey.shade400))),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(avatar),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullname,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColor.darkBlue),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.chat_bubble_outline,
                          color: AppColor.skyBlue,
                          size: 20,
                        ),
                        Text(
                          ' 24/10/2018',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: AppColor.skyBlue),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
                text: const TextSpan(
                    text:
                        'Hoàn thiện Cổng dịch vụ công trực tuyến đảm bảo đồng bộ, liên thông, an toàn, an ninh hệ thống; tăng cường phối hợp với Trung tâm Hành chính công tỉnh,',
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black))),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: [
                // RichText(
                //     text: TextSpan(children: [
                //   const TextSpan(
                //       text: 'Gửi đến: ',
                //       style: TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.w300,
                //           color: Colors.black)),
                //   TextSpan(
                //       text: 'Chienlv, Thinhlq',
                //       style: const TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.w300,
                //           color: AppColor.skyBlue),
                //       recognizer: LongPressGestureRecognizer()
                //         ..onLongPress = () {
                //           setState(() {
                //             findNotePosition(actionKey);
                //             floatingNote = _createrFloatingNote(
                //                 -5.0, -12.0);
                //             Overlay.of(context).insert(floatingNote!);
                //           });
                //         }),
                //   third
                //       ? const TextSpan(
                //           text: ', Anhnd',
                //           style: TextStyle(
                //               fontSize: 14,
                //               fontWeight: FontWeight.w300,
                //               color: Colors.black))
                //       : const TextSpan(
                //           text: '',
                //         )
                // ])),
                const Text('Gửi đến: ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black)),
                GestureDetector(
                  key: key,
                  onLongPress: () {
                    setState(() {
                      findNotePosition(key);
                      floatingNote = _createrFloatingNote(0.0, -75.0);
                      Overlay.of(context).insert(floatingNote!);
                    });
                  },
                  onLongPressEnd: (_) {
                    floatingNote?.remove();
                    isNoteDisplay = !isNoteDisplay;
                  },
                  child: const Text('Chienlv, Thinhlq',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: AppColor.skyBlue)),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  OverlayEntry _createrFloatingNote(double x, double y) {
    return OverlayEntry(builder: ((context) {
      return Positioned(
        width: 120,
        height: 70,
        left: xPosition + x,
        top: yPosition + height + y,
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/backgrounds/ui_menu_light.svg',
              width: 135.0,
              height: 75.0,
            ),
            const Positioned(
              top: 18,
              left: 18,
              child: Text('Chưa xem',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      // fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none)),
            ),
          ],
        ),
      );
    }));
  }

  Container _buildToolBar() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      color: Colors.lightBlue.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Ý kiến trao đổi',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(AppRouter.enterCommentsScreen);
              },
              icon: SvgPicture.asset(
                'assets/icons/chat2_icon.svg',
                width: 38,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void findNotePosition(GlobalKey actionKey) {
    RenderBox renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    Offset position = renderBox.localToGlobal(Offset.zero);
    xPosition = position.dx;
    yPosition = position.dy;
  }

  // void hideNote() {
  //   floatingNote?.remove();
  //   isNoteDisplay = !isNoteDisplay;
  // }
}
