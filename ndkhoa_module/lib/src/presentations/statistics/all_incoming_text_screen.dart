import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndkhoa_module/src/components/app_dropdown.dart';
import 'package:ndkhoa_module/src/components/app_dropdown_2.dart';
import 'package:ndkhoa_module/src/core/constants/app_textstyle.dart';
import 'package:ndkhoa_module/src/presentations/statistics/controllers/all_incoming_text_controllers.dart';

///Tất cả văn bản đến
class AllIncomingTextScreen extends GetWidget<AllIncomingTextController> {
  const AllIncomingTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => 
        Column(
          children: [
            _buildBox("Phòng nghiên cứu triển khai"),
            _buildListView(),
          ],
        ),
      ),
    );
  }

  Container _buildBox(String title) {
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
            Row(
              children: [
                _buildFilter(),
                const Icon(Icons.sort),
              ],
            )
          ],
        ));
  }

  Expanded _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(bottom: 8, top: 8, left: 12, right: 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 2.5,
                    )),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Text> [
                      Text("Số/ký hiệu gốc: 7288/UBND-TP", style: AppTextStyle.bodyTextStyle,),
                      Text("Ngày ban hành: 26/09/2018", style: AppTextStyle.bodyTextStyle,),
                      Text("Cơ quan ban hành: UBND tỉnh Thừa Thiên Huế", style: AppTextStyle.bodyTextStyle,),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  DropdownCustom2<int> _buildFilter() {
    return DropdownCustom2<int>(
      onChange: (index, index2) {
          controller.dropDownFilterValue.value = index;
          controller.dropDownFilterValue2.value = index2;
      },
      dropdownButtonStyle: const DropdownButtonStyle(
        elevation: 1,
      ),
      dropdownStyle: const DropdownStyle(
        offset: Offset(-180, 25),
        width: 225,
        elevation: 1,
        padding: EdgeInsets.all(6),
      ),
      title: const Text(
        "Trạng thái",
        style: AppTextStyle.titleTextStyle,
      ),
      title2: const Text(
        "Nguồn văn bản",
        style: AppTextStyle.titleTextStyle,
      ),
      icon: const Icon(Icons.filter_list_alt),
      enableIconAnimation: false,
      items: controller.listFilter.value
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
      items2: controller.listFilter2.value
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
      child: const Center(),
    );
  }
}