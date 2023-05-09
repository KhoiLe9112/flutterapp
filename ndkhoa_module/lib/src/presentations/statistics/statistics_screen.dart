import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ndkhoa_module/src/components/app_day_picker.dart';
import 'package:ndkhoa_module/src/components/app_dropdown.dart';
import 'package:ndkhoa_module/src/core/constants/app_textstyle.dart';
import 'package:ndkhoa_module/src/presentations/statistics/controllers/statistics_controllers.dart';
import 'package:ndkhoa_module/src/router/app_router.dart';

///Thống kê
class StatisticsScreen extends GetWidget<StatisticsController> {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(
        () => Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Row(children: [
                const Text("Từ "),
                DayPickerCustom(
                  initdate: controller.format.value.parse(controller.statisticsDateFrom.value),
                  onChange: (date) {
                    controller.statisticsDateFrom.value = controller.format.value.format(date);
                  },
                  child: Text(
                    controller.statisticsDateFrom.value,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                const Text(" đến "),
                DayPickerCustom(
                  initdate: controller.format.value.parse(controller.statisticsDateTo.value),
                  onChange: (date) {
                    controller.statisticsDateTo.value = controller.format.value.format(date);
                  },
                  child: Text(
                    controller.statisticsDateTo.value,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ]),
            ),
            _buildBox(controller.listtitle1.value[controller.dropDownValue.value], "Tổng số: 5 văn bản", false),
            IntrinsicHeight(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildStatus("ĐÃ XỬ LÝ", 10, "Đúng hạn"),
                      const VerticalDivider(),
                      _buildStatus("CHƯA XỬ LÝ", 160, "Đúng hạn"),
                      const VerticalDivider(),
                      _buildStatus("CHƯA XỬ LÝ", 5, "Quá hạn"),
                      const VerticalDivider(),
                      _buildStatus("TỈ LỆ XỬ LÝ", 46, "Đúng hạn"),
                    ]),
              ),
            ),
            _buildBox(controller.listtitle2.value[controller.dropDownValue.value], "Trễ hạn: 5 văn bản", true),
            _buildStatisticsListView(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "THỐNG KÊ",
        style: AppTextStyle.titleTextStyle,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/Search.svg")),
        DropdownCustom(
            onChange: (index) {
              controller.dropDownValue.value = index;
            },
            title: const Text(
              "Chọn thống kê",
              style: AppTextStyle.titleTextStyle,
            ),
            icon: const Icon(
              Icons.more_vert,
            ),
            enableIconAnimation: false,
            initIndex: 0,
            items: controller.list.value
                .asMap()
                .entries
                .map(
                  (item) => DropdownItem<int>(
                    value: item.key + 1,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        item.value,
                        style: AppTextStyle.bodyTextStyle,
                      ),
                    ),
                  ),
                )
                .toList(),
            dropdownButtonStyle: const DropdownButtonStyle(
              elevation: 1,
            ),
            dropdownStyle: const DropdownStyle(
              offset: Offset(-160, 40),
              width: 180,
              elevation: 1,
              padding: EdgeInsets.all(6),
            ),
            child: const Center())
      ],
    );
  }

  ///Hiển thị danh sách nguồn công việc
  Widget _buildStatisticsListView() {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(AppRouter.allIncomingTextScreen);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BAN GIÁM ĐỐC",
                    style: AppTextStyle.bodyTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(
                          text: "Văn bản đến ",
                          style: AppTextStyle.bodyTextStyle,
                          children: <TextSpan>[
                            TextSpan(
                              text: "10",
                              style: AppTextStyle.statisticsNumberTextStyle,
                            )
                          ])),
                      Text(
                        "0",
                        style: AppTextStyle.statisticsNumber2TextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }

  ///Hộp hiển thị tiêu đề và số lượng văn bản
  Container _buildBox(String title, String text, bool titleRedColor) {
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
            Text(
              text,
              style: titleRedColor
                  ? const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    )
                  : const TextStyle(),
            ),
          ],
        ));
  }

  ///Hiển thị trạng thái các công việc
  Widget _buildStatus(String title, int number, String status) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouter.statistics2Screen);
      },
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(title == "TỈ LỆ XỬ LÝ" ? "$number%" : "$number",
                style: status == "Quá hạn"
                    ? AppTextStyle.statisticsNumber2TextStyle
                    : AppTextStyle.statisticsNumberTextStyle),
          ),
          Text(
            status,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
