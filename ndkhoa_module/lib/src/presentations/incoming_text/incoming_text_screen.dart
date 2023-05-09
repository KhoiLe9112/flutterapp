import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ndkhoa_module/src/components/app_dropdown.dart';
import 'package:ndkhoa_module/src/components/app_dropdown_2.dart';
import 'package:ndkhoa_module/src/core/constants/app_textstyle.dart';
import 'package:ndkhoa_module/src/presentations/incoming_text/controllers/incoming_text_controllers.dart';
import 'package:ndkhoa_module/src/router/app_router.dart';

//Văn bản đến
class IncomingTextScreen extends GetWidget<IncomingTextController> {
  const IncomingTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "VĂN BẢN ĐẾN",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRouter.textSearchScreen);
            },
            icon: SvgPicture.asset("assets/icons/Search.svg"),
          )
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              color: Colors.lightBlue[100],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildYearFilter(),
                        Text("Tổng số: ${20}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildFilter(),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: _buildSortFilter(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _buildListView()
            //TextListViewCustom(list)
          ],
        ),
      ),
    );
  }

  ///Hiển thị danh sách văn bản
  Expanded _buildListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppRouter.textDetailsScreen);
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 8, top: 8, left: 12, right: 64),
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text("7288/UBND-TP", style: AppTextStyle.titleTextStyle,),
                        ),
                        Text("V/v hoàn thành nâng cấp phiên bản phần mềm Quản lý văn bản và điều hành", style: AppTextStyle.bodyTextStyle,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ///Bộ lọc theo năm
  DropdownCustom<int> _buildYearFilter() {
    return DropdownCustom<int>(
      onChange: (index) {
          controller.dropDownYearValue.value = index;
      },
      dropdownButtonStyle: const DropdownButtonStyle(
        elevation: 1,
      ),
      dropdownStyle: const DropdownStyle(
        width: 90,
        elevation: 1,
        padding: EdgeInsets.all(6),
      ),
      initIndex: 0,
      title: const Text(
        "Năm",
        style: AppTextStyle.titleTextStyle,
      ),
      items: controller.listYear.value
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
      child: Text(
        controller.listYear.value[controller.dropDownYearValue.value],
        style: AppTextStyle.titleTextStyle,
      ),
    );
  }

  ///Bộ lọc văn bản
  DropdownCustom<int> _buildFilter() {
    return DropdownCustom<int>(
      onChange: (index) {
          controller.dropDownFilterValue.value = index;
      },
      dropdownButtonStyle: const DropdownButtonStyle(
        elevation: 1,
      ),
      dropdownStyle: const DropdownStyle(
        offset: Offset(-180, 25),
        width: 200,
        elevation: 1,
        padding: EdgeInsets.all(6),
      ),
      title: const Text(
        "Lọc văn bản",
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
      child: const Center(),
    );
  }

  ///Bộ lọc sắp xếp
  DropdownCustom2<int> _buildSortFilter() {
    return DropdownCustom2<int>(
      onChange: (index, index2) {
        controller.dropDownSortValue.value = index;
        controller.dropDownSortValue2.value = index2;
      },
      dropdownButtonStyle: const DropdownButtonStyle(
        elevation: 1,
      ),
      dropdownStyle: const DropdownStyle(
        offset: Offset(-200, 25),
        width: 225,
        elevation: 1,
        padding: EdgeInsets.all(6),
      ),
      title: const Text(
        "Sắp xếp",
        style: AppTextStyle.titleTextStyle,
      ),
      icon: const Icon(Icons.sort),
      enableIconAnimation: false,
      items: controller.listSort.value
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
      items2: controller.listSort2.value
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