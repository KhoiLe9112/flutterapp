import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/app_button.dart';
import '../core/theme/app_color.dart';

class TaskHandleScreen extends StatefulWidget {
  const TaskHandleScreen({super.key});

  @override
  State<TaskHandleScreen> createState() => _TaskHandleScreenState();
}

class _TaskHandleScreenState extends State<TaskHandleScreen> {
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _buildToolbar(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
              child: Column(children: [
                _buildDesbribe(),
                const SizedBox(
                  height: 15.0,
                ),
                _buildDate(),
                const SizedBox(
                  height: 20.0,
                ),
                _buildForm(),
                _buildButton()
              ]),
            )
          ],
        ),
      ),
    );
  }

  Row _buildDate() {
    return Row(
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
              size: 24,
            ),
            Text(' 1', style: TextStyle(fontSize: 18)),
          ],
        )
      ],
    );
  }

  RichText _buildDesbribe() {
    return RichText(
        text: const TextSpan(
            text:
                '45/TB-UBND - Kết luận của Phó Chủ tịch Thường trực UBND tỉnh tại buổi làm việc về Cổng dịch vụ công trực tuyến vận hành tại Trung tâm Hành chính công tỉnh',
            style: TextStyle(fontSize: 18, color: Colors.black, height: 1.4)));
  }

  Container _buildButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: AppButton(
                  text: 'Lưu',
                  backColor: AppColor.skyBlue,
                  textColor: Colors.white,
                  radius: 16,
                  textSize: 18,
                  horizontal: 10,
                  vertical: 5)),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: AppButton(
                text: 'Hủy bỏ',
                backColor: Colors.grey.shade400,
                textColor: Colors.black,
                radius: 16,
                textSize: 18,
                horizontal: 10,
                vertical: 5),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: AppButton(
                text: 'Lập dự thảo',
                backColor: Colors.grey.shade400,
                textColor: Colors.black,
                radius: 16,
                textSize: 18,
                horizontal: 10,
                vertical: 5),
          ),
        ],
      ),
    );
  }

  Container _buildToolbar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.lightBlue.shade100,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
        child: Text(
          'Xử lý',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
    );
  }

  Container _buildForm() {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Trạng thái',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            Container(
                color: Colors.white,
                // width: MediaQuery.of(context).size.width,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Đang thực hiện',
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                    )
                  ],
                )),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nội dung',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 120,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Nội dung xử lý',
                    style: TextStyle(fontSize: 18),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'File đính kèm',
                  style: TextStyle(
                      fontSize: 18,
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
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.attach_file,
                              size: 24,
                              color: AppColor.skyBlue,
                            ),
                            Text(
                              ' tenfile_1',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.remove,
                          size: 24,
                        )
                      ],
                    )),
                Container(
                    color: Colors.white,
                    // width: MediaQuery.of(context).size.width,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.attach_file,
                              size: 24,
                              color: AppColor.skyBlue,
                            ),
                            Text(
                              ' tenfile_2',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.remove,
                          size: 24,
                        )
                      ],
                    )),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.add, size: 32)),
            ),
          ],
        ),
      ),
    );
  }
}
