import 'package:flutter/material.dart';
import 'package:qlvbdh/src/core/theme/app_color.dart';

class CommunicationScreen extends StatelessWidget {
  CommunicationScreen({super.key});

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
            icon:
                const Icon(Icons.arrow_back, size: 26, color: AppColor.skyBlue)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 26, color: AppColor.darkBlue),
          ),
          // IconButton(
          //   iconSize: 10,
          //   icon: Image.asset(
          //     'assets/search-icon.png',
          //     fit: BoxFit.fill,
          //   ),
          //   onPressed: () {},
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 26, color: AppColor.darkBlue),
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
                    'assets/avatar1.png', 'Lê Quốc Thịnh'),
                _buildCommunication(
                    'Tiếp tục Tao trang và cài các module, cấu hình, phần mềm HSCV cho các trang điều hành của các xã thuộc UBND Huyện Phú Lộc',
                    'assets/avatar2.png',
                    'Nguyễn Văn Tình'),
                _buildCommunication(
                    '3116/UBND-CNTT - V/v thực hiện nội dung Xây dựng kiến trúc các kênh tương tác Chính quyền',
                    'assets/avatar3.png',
                    'Lê Vĩnh Chiến'),
                _buildCommunication('Nhật ký marketing & sales',
                    'assets/avatar2.png', 'Nguyễn Văn Tình'),
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
                  image: AssetImage('assets/Group 137.png'),
                  fit: BoxFit.fill)),
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
              children: const [
                Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      'Trao đổi',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.filter_alt_sharp,
                      color: Colors.black,
                      size: 24,
                    )),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {},
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

  Padding _buildCommunication(String title, String avatar, String fullname) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
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
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColor.skyBlue),
              )),
            ),
            // Spacer(flex: 10,),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
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
                          fontSize: 16,
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
                          size: 15,
                        ),
                        Text(
                          ' 24/10/2018',
                          style: TextStyle(
                              fontSize: 15,
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
              height: 13,
            ),
            RichText(
                text: const TextSpan(
                    text:
                        'Hoàn thiện Cổng dịch vụ công trực tuyến đảm bảo đồng bộ, liên thông, an toàn, an ninh hệ thống; tăng cường phối hợp với Trung tâm Hành chính công tỉnh,',
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black))),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Gửi đến: ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black)),
                  TextSpan(
                      text: 'Chienlv, Thinhlq',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: AppColor.skyBlue))
                ])),
                const Icon(
                  Icons.chat_bubble_outline,
                  color: AppColor.skyBlue,
                  size: 30,
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
