import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ndkhoa_module/src/presentations/text_details.dart';
import 'package:ndkhoa_module/src/router/app_router.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                                builder: (context) =>
                                    const TextDetailsScreen()));
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

            ListView.builder(

                ///Tat scroll cua listview
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return _buildRearchResults(context);
                })
          ],
        ),
      ),
    );
  }

  Widget _buildRearchResults(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouter.textDetailsScreen);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SvgPicture.asset('assets/icons/point_icon.svg'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '7288/UBND-TP',
                  style: TextStyle(
                      // height: 1.3,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 60.0,
                  child: const Text(
                    'V/v hoàn thành nâng cấp phiên bản phần mềm Quản lý văn bản và điều hành',
                    style: TextStyle(
                        // height: 1.3,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            // RichText(
            //     // textAlign: TextAlign.left,
            //     text: const TextSpan(
            //   children: [
            //     TextSpan(
            //         text: '7288/UBND-TP\n',
            //         style: TextStyle(
            //             // height: 1.3,
            //             fontSize: 14,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black)),
            //     TextSpan(
            //         text:
            //             'V/v hoàn thành nâng cấp phiên bản phần mềm Quản lý văn bản và điều hành',
            //         style: TextStyle(
            //             // height: 1.3,
            //             fontSize: 14,
            //             color: Colors.black))
            //   ],
            // ))
          ],
        ),
      ),
    );
  }
}
