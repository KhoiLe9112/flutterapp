import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:ndkhoa_module/src/components/app_weekly.dart';
import 'package:ndkhoa_module/src/core/constants/app_textstyle.dart';
//import 'package:hue_moffice/src/presentations/auth/controllers/auth_controller.dart';
//import 'package:hue_moffice/src/presentations/home/controllers/home_controller.dart';
import 'package:ndkhoa_module/src/presentations/home/controllers/home_controller.dart';
import 'package:ndkhoa_module/src/router/app_router.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({super.key});
  //var authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SafeArea(
        child: SliderDrawer(
          appBar: const SliderAppBar(
            appBarColor: Colors.white,
            title: Text("QUẢN LÝ VĂN BẢN VÀ ĐIỀU HÀNH",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
            trailing: Icon(Icons.search),
            appBarPadding: EdgeInsets.all(8),
          ),
          sliderOpenSize: 300,
          slider: _buildGradientBox(
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 185, 103, 200)))),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset("assets/icons/avatar.svg"),
                      ),
                      const SizedBox(width: 16),
                      Text.rich(
                        TextSpan(
                          text: "ThinhLQ",
                          style: AppTextStyle.drawerTextStyleBold,
                          children: [
                            TextSpan(
                                text: "\nTrung tâm CNTT tỉnh",
                                style: AppTextStyle.drawerTextStyle)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                _buildDrawerItem(
                    "VĂN BẢN ĐẾN",
                    Image.asset(
                      "assets/icons/baseline-assignment_return-1.png",
                      scale: 0.8,
                    ),
                    () {
                      Get.toNamed(AppRouter.incomingTextScreen);
                    }),
                _buildDrawerItem(
                    "VĂN BẢN ĐI",
                    Image.asset(
                      "assets/icons/baseline-assignment_return-24px.png",
                      scale: 0.8,
                    ),
                    () {

                    }),
                _buildDrawerItem(
                    "CÔNG VIỆC",
                    Image.asset(
                      "assets/icons/baseline-list_alt-24px.png",
                      scale: 0.8,
                    ),
                    () {
                      Get.toNamed(AppRouter.personalTaskScreen);
                    }),
                _buildDrawerItem(
                    "LỊCH CÔNG TÁC",
                    Image.asset(
                      "assets/icons/baseline-date_range-24px.png",
                      scale: 0.8,
                    ),
                    () {

                    }),
                _buildDrawerItem(
                    "THỐNG KÊ",
                    Image.asset(
                      "assets/icons/thongke.png",
                      width: 30,
                      scale: 0.8,
                    ),
                    () {
                      Get.toNamed(AppRouter.statisticsScreen);
                    }),
                _buildDrawerItem(
                    "TỔNG QUAN",
                    Image.asset(
                      "assets/icons/tongquan.png",
                      width: 30,
                      scale: 0.8,
                    ),
                    () {}),
                _buildDrawerItem(
                    "HƯỚNG DẪN SỬ DỤNG",
                    Image.asset(
                      "assets/icons/baseline-school-24px.png",
                      scale: 0.8,
                    ),
                    () {}),
              ],
            ),
          ),
          child: Scrollbar(
            child: ListView(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              children: [
                _buildTextBox("VĂN BẢN ĐẾN"),
                const SizedBox(height: 20),
                _buildTextBox("VĂN BẢN ĐI", true),
                const SizedBox(height: 20),
                _buildWeekly(controller.dailyWork.value),
                Text(controller.userToken.value),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildDrawerItem(String text, Widget icon, Function()? onTap) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 28),
            icon,
            const SizedBox(width: 10),
            Text(
              text,
              style: AppTextStyle.drawerTextStyleBold,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekly(List<String> dailyWork) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: _buildGradientBox(
            const Text("LỊCH CÔNG TÁC",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                )),
          ),
        ),
        const WeeklyCustom(),
        const SizedBox(height: 16),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _buildDaily(dailyWork[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemCount: dailyWork.length,
        )
      ],
    );
  }

  Container _buildDaily(String content) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            "09:20",
            style: const TextStyle(
              fontSize: 17,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 5,
            ),
          ),
          Text(
            content,
            style: AppTextStyle.bodyTextStyle,
          )
        ],
      ),
    );
  }

  Container _buildTextBox(String title, [bool hideicon = false]) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildGradientBox(
                Text(title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    )),
              ),
              Text(
                "Từ 25/9/2018 đến 25/9/2018",
                style: AppTextStyle.bodyTextStyle,
              ),
              !hideicon ? Icon(Icons.notifications) : const Center(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatus(10, "Chưa thực hiện"),
                const VerticalDivider(),
                _buildStatus(160, "Chưa xem"),
                const VerticalDivider(),
                _buildStatus(5, "Trễ hạn"),
                const VerticalDivider(),
                _buildStatus(2, "Trao đổi"),
              ],
            ),
          ),
        )
      ]),
    );
  }

  Container _buildGradientBox(Widget child) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[Colors.purple, Colors.purple]),
      ),
      child: child,
    );
  }

  Widget _buildStatus(int number, String status) {
    return Flexible(
      child: Column(
        children: [
          Text("$number",
              style: status == "Trễ hạn"
                  ? AppTextStyle.statisticsNumber2TextStyle
                  : AppTextStyle.statisticsNumberTextStyle),
          const SizedBox(height: 5),
          Text(
            status,
            style: AppTextStyle.bodyTextStyle,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
