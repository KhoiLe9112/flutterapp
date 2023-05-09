import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ndkhoa_module/src/core/constants/app_textstyle.dart';
import 'package:ndkhoa_module/src/router/app_router.dart';

///Chưa xử lý quá hạn, ...
class Statistics2Screen extends StatelessWidget {
  const Statistics2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _buildBox("Phòng ban", "Trễ hạn"),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRouter.allIncomingTextScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("PHÒNG NGHIÊN CỨU TRIỂN KHAI", style: AppTextStyle.bodyTextStyle,),
                            Text("5", style: AppTextStyle.statisticsNumber2TextStyle,),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container _buildBox(String title, String text) {
    return Container(
        color: Colors.lightBlue[100],
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyle.titleTextStyle,
            ),
            Text(text,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                )),
          ],
        ));
  }
}
