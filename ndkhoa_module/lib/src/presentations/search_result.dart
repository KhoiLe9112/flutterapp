import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
                size: 30, color: AppColor.skyBlue)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ///Mo ta
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 22.0, bottom: 22.0),
              child: Column(
                children: const [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Loại văn bản: Công văn',
                      style: TextStyle(fontSize: 18, color: AppColor.darkBlue),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Cơ quan ban hành: UBND tỉnh Thừa Thiên Huế',
                      style: TextStyle(fontSize: 18, color: AppColor.darkBlue),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.lightBlue.shade100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                            text: 'Kết quả tìm kiếm\n',
                            style: TextStyle(
                                height: 1.4,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColor.darkBlue),
                          ),
                          TextSpan(
                            text: 'Tổng số: 15',
                            style: TextStyle(
                                height: 1.4,
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: AppColor.darkBlue),
                          ),
                        ]),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/sort_icon.svg',
                      width: 30,
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
        padding: const EdgeInsets.fromLTRB(25.0, 15.0, 50.0 ,15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset('assets/icons/point_icon.svg'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '7288/UBND-TP',
                  style: TextStyle(
                      height: 1.8,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.darkBlue),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 120.0,
                  child: const Text(
                    'V/v hoàn thành nâng cấp phiên bản phần mềm Quản lý văn bản và điều hành',
                    style: TextStyle(
                        height: 1.4,
                        fontSize: 18,
                        color: AppColor.darkBlue),
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
