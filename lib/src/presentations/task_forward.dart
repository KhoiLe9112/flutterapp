import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qlvbdh/src/components/app_button.dart';

import '../core/theme/app_color.dart';

class TaskForwardScreen extends StatefulWidget {
  const TaskForwardScreen({super.key});

  @override
  State<TaskForwardScreen> createState() => _TaskForwardScreenState();
}

class _TaskForwardScreenState extends State<TaskForwardScreen> {
  bool isChecked = false;
  DateTime _dateTime = DateTime.now();

  Future<DateTime?> _showDayPicker(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2014),
        lastDate: DateTime(2024));
  }

  Color getColor(Set<MaterialState> states) {
    // const Set<MaterialState> interactiveStates = <MaterialState>{
    //   MaterialState.pressed,
    //   MaterialState.hovered,
    //   MaterialState.focused,
    // };
    // if (states.any(interactiveStates.contains)) {
    //   return Colors.blue;
    // }
    return Colors.grey.shade600;
  }

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.lightBlue.shade100,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Text(
                  'Chuyển xử lý',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  RichText(
                      text: const TextSpan(
                          text:
                              '45/TB-UBND - Kết luận của Phó Chủ tịch Thường trực UBND tỉnh tại buổi làm việc về Cổng dịch vụ công trực tuyến vận hành tại Trung tâm Hành chính công tỉnh',
                          style: TextStyle(
                              fontSize: 14, color: Colors.black, height: 1.3))),
                  const SizedBox(
                    height: 10.0,
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
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Wrap(
                    runSpacing: 2.0,
                    children: [
                      _buildDateTimePicker(context),
                      _buildInputTextField('Chủ trì thực hiện'),
                      _buildInputTextField('Người giao việc'),
                      _buildListTextField('Nguời phối hợp', 'Nguyễn Văn Tình',
                          'Nguyễn Thị Thanh Thủy'),
                      _buildOpinionTextField(),
                      _buildAddFiles(),
                      _buildListTextField('Nguời theo dõi', 'Nguyễn Văn Tình',
                          'Nguyễn Thị Thanh Thủy'),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: AppButton(
                          text: 'Chuyển',
                          backColor: AppColor.skyBlue,
                          textColor: Colors.white,
                          radius: 14,
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: AppButton(
                          text: 'Hủy bỏ',
                          backColor: Colors.grey.shade400,
                          textColor: Colors.black,
                          radius: 14,
                        )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildDateTimePicker(BuildContext context) {
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
                  'Thời gian hoàn chỉnh',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                  color: Colors.white,
                  height: 35,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () async {
                          _dateTime = (await _showDayPicker(context))!;
                          setState(() {
                            _dateTime;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/calendar_icon.svg',
                          width: 16,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Container _buildInputTextField(String text) {
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
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 18,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Lê Quốc Thịnh',
                      style: TextStyle(fontSize: 14),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Container _buildListTextField(String title, String name1, String name2) {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
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
                      children: [
                        Text(
                          name1,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const Icon(
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
                      children: [
                        Text(
                          name2,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const Icon(
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.add, size: 28)),
            ),
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
            Row(
              children: [
                Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                const Text(
                  'Yêu cầu có văn bản trả lời',
                  style: TextStyle(fontSize: 14),
                )
              ],
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'File đính kèm',
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
                              ' tenfile_2',
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
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.add, size: 28)),
            ),
          ],
        ),
      ),
    );
  }
}
