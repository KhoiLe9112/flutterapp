import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ndkhoa_module/src/router/app_router.dart';

import '../components/app_button.dart';
import '../core/theme/app_color.dart';

class EnterCommentsScreen extends StatefulWidget {
  const EnterCommentsScreen({super.key});

  @override
  State<EnterCommentsScreen> createState() => _EnterCommentsScreenState();
}

class _EnterCommentsScreenState extends State<EnterCommentsScreen> {
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
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage('assets/backgrounds/background1.png'),
                    colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.modulate),
                    fit: BoxFit.fill)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _buildToolBar(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Wrap(
                    runSpacing: 2.0,
                    children: [
                      _buildOpinionTextField(),
                      _buildAddFiles(),
                      _buildListTextField()
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: AppButton(
                        // action: ,
                        navigate: () {
                          Get.toNamed(AppRouter.communication1Screen);
                        },
                        text: 'Chuyển',
                        backColor: AppColor.skyBlue,
                        textColor: Colors.white,
                        radius: 14,
                        textSize: 14,
                        horizontal: 14,
                        vertical: 14,
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: AppButton(
                        // action: ,
                        text: 'Hủy bỏ',
                        backColor: Colors.grey.shade400,
                        textColor: Colors.black,
                        radius: 14,
                        textSize: 14,
                        horizontal: 14,
                        vertical: 14,
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildListTextField() {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Gửi đến',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            Wrap(
              runSpacing: 2.0,
              children: [
                Container(
                    color: Colors.white,
                    // width: MediaQuery.of(context).size.width,
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Nguyễn Văn Tình',
                          style: TextStyle(fontSize: 14),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                        )
                      ],
                    )),
                Container(
                    color: Colors.white,
                    // width: MediaQuery.of(context).size.width,
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Nguyễn Thị Thanh Thủy',
                          style: TextStyle(fontSize: 14),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                        )
                      ],
                    )),
                Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: 35,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Phòng HCTH',
                        style: TextStyle(fontSize: 14),
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Container _buildAddFiles() {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'File đính kèm',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Icon(Icons.add, size: 28)
                ],
              ),
            ),
            Container(
                color: Colors.white,
                // width: MediaQuery.of(context).size.width,
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.attach_file,
                          size: 18,
                          color: AppColor.skyBlue,
                        ),
                        Text(
                          ' tenfile_1',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.remove,
                      size: 18,
                    )
                  ],
                )),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Container _buildOpinionTextField() {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Ý kiến xử lý',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Nội dung yêu cầu xử lý',
                    style: TextStyle(fontSize: 14),
                  ),
                )),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Container _buildToolBar() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      color: Colors.lightBlue.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Ý kiến trao đổi',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/chat2_icon.svg',
                width: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
