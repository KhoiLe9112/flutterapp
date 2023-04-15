import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qlvbdh/src/presentations/text_details.dart';

import '../core/theme/app_color.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,
                size: 26, color: AppColor.skyBlue)),
      ),
      body: Column(
        children: [
          ///Mo ta
          Padding(
            padding: const EdgeInsets.only(left: 45, top: 18, bottom: 18),
            child: Column(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Loại văn bản: Công văn',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cơ quan ban hành: UBND tỉnh Thừa Thiên Huế',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          Container(
            color: Colors.lightBlue.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Kết quả tìm kiếm\n',
                          style: TextStyle(
                              height: 1.3,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Tổng số: 15',
                          style: TextStyle(
                              height: 1.3,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TextDetailsScreen()));
                    },
                    child: SvgPicture.asset(
                      'assets/icons/sort_icon.svg',
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
