import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ndkhoa_module/src/core/theme/app_color.dart';
import 'package:ndkhoa_module/src/router/app_router.dart';

class CommunicationScreen extends StatelessWidget {
  const CommunicationScreen({super.key});

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
            // icon: const Icon(Icons.add, size: 26, color: AppColor.darkBlue),
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
                _buildCommunication('Cổng dịch vụ công trực tuyến',
                    'assets/avatars/avatar1.png', 'Lê Quốc Thịnh', () {
                      Get.toNamed(AppRouter.enterCommentsScreen);
                    }),
                _buildCommunication(
                    'Tiếp tục Tao trang và cài các module, cấu hình, phần mềm HSCV cho các trang điều hành của các xã thuộc UBND Huyện Phú Lộc',
                    'assets/avatars/avatar2.png',
                    'Nguyễn Văn Tình'),
                _buildCommunication(
                    '3116/UBND-CNTT - V/v thực hiện nội dung Xây dựng kiến trúc các kênh tương tác Chính quyền',
                    'assets/avatars/avatar3.png',
                    'Lê Vĩnh Chiến'),
                _buildCommunication('Nhật ký marketing & sales',
                    'assets/avatars/avatar2.png', 'Nguyễn Văn Tình'),
              ],
            ),
          )
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Trao đổi',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child:
                      const Icon(
                        Icons.filter_alt_sharp,
                        color: Colors.black,
                        size: 30,
                      )
                ),
                const SizedBox(
                  width: 10.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/sort_icon.svg',
                    width: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildCommunication(String title, String avatar, String fullname, [Function()? onTap]) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 1.0, color: Colors.grey.shade400))),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                  text: TextSpan(
                text: title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColor.skyBlue),
              )),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(avatar),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text(
                      fullname,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColor.darkBlue),
                    ),
                    const SizedBox(
                      height: 5,
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
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Gửi đến: ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                  TextSpan(
                      text: 'Chienlv, Thinhlq',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: AppColor.skyBlue))
                ])),
                GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    'assets/icons/chat_icon.svg',
                    width: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
