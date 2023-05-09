import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ndkhoa_module/src/components/app_button_2.dart';
import 'package:ndkhoa_module/src/components/app_dropdown.dart';
import 'package:ndkhoa_module/src/components/app_dropdown_2.dart';
import 'package:ndkhoa_module/src/components/app_task_box.dart';
import 'package:ndkhoa_module/src/components/app_task_box_2.dart';
import 'package:ndkhoa_module/src/core/constants/app_textstyle.dart';
import 'package:ndkhoa_module/src/presentations/tasks/controllers/new_task_controllers.dart';

class NewTaskScreen extends GetWidget<NewTaskController> {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CÔNG VIỆC",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            _buildBox("Tạo mới công việc"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  TaskBoxCustom(
                    title: "Tiêu đề",
                    children: [
                    const SizedBox(height: 5),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                      ),
                    )
                  ]),
                  const SizedBox(height: 1),
                  TaskBoxCustom(
                    title: "Thời gian hoàn thành",
                    children: [
                    const SizedBox(height: 5),
                    Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                DateFormat("dd/MM/yyyy")
                                    .format(controller.date.value),
                                style: AppTextStyle.bodyTextStyle),
                            IconButton(
                                onPressed: () async {
                                  controller.date.value = (await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(DateTime.now().year),
                                    lastDate:
                                        DateTime(DateTime.now().year + 100),
                                  ))!;
                                },
                                icon: const Icon(Icons.calendar_month))
                          ],
                        )),
                  ]),
                  const SizedBox(height: 1),
                  TaskBoxCustom(
                    title: "Chủ trì thực hiện",
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconPadding: const EdgeInsets.only(right: 3),
                    onTap: () {
                      controller.boolCTTH.value = !controller.boolCTTH.value;
                    },
                    children: controller.boolCTTH.value ? [
                    const SizedBox(height: 5),
                    DropdownCustom2(
                        onChange: (index, index2) {},
                        title: const Text(
                          "Phòng ban",
                          style: AppTextStyle.titleTextStyle,
                        ),
                        items: controller.listGroup.value
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
                        title2: const Text(
                          "Cá nhân",
                          style: AppTextStyle.titleTextStyle,
                        ),
                        items2: controller.listSingle.value
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
                        dropdownStyle: const DropdownStyle(
                          padding: EdgeInsets.all(8),
                          //offset: Offset(-225, 10),
                          width: 260,
                        ),
                        hideIcon: true,
                        child: Expanded(
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(16),
                            child: Text("Lê Quốc Thịnh",
                                style: AppTextStyle.bodyTextStyle),
                          ),
                        )),
                  ] : []),
                  const SizedBox(height: 1),
                  TaskBoxCustom(
                    title: "Người giao việc",
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconPadding: const EdgeInsets.only(right: 3),
                    onTap: () {
                      controller.boolNGV.value = !controller.boolNGV.value;
                    },
                    children: controller.boolNGV.value ? [
                    const SizedBox(height: 5),
                    DropdownCustom2(
                        onChange: (index, index2) {
                          index2 != -1
                              ? controller.single.value =
                                  controller.listSingle.value[index2]
                              : controller.single.value = "";
                          // if (index == 2) {
                          //   controller.valueChange();
                          // }
                        },
                        initIndex: 0,
                        title: const Text(
                          "Phòng ban",
                          style: AppTextStyle.titleTextStyle,
                        ),
                        items: controller.listGroup.value
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
                        title2: const Text(
                          "Cá nhân",
                          style: AppTextStyle.titleTextStyle,
                        ),
                        items2: controller.listSingle.value
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
                        dropdownStyle: const DropdownStyle(
                          padding: EdgeInsets.all(8),
                          //offset: Offset(-225, 10),
                          width: 260,
                        ),
                        hideIcon: true,
                        child: Expanded(
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(16),
                            child: Text(controller.single.value,
                                style: AppTextStyle.bodyTextStyle),
                          ),
                        )),
                  ] : []),
                  const SizedBox(height: 1),
                  TaskBoxCustom2(
                      title: "Người phối hợp",
                      icon: const Icon(Icons.add, size: 32),
                      //iconPadding: const EdgeInsets.only(right: 2),
                      showItem: true,
                      moveIcon: true,
                      onTap: () {},
                      listItem: [
                        "Nguyễn Văn Tình",
                        "Nguyễn Thị Thanh Thủy",
                        "Phòng HCTH"
                      ]),
                  const SizedBox(height: 1),
                  TaskBoxCustom(
                    title: "Ý kiến xử lý",
                    children: [
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 200,
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: "Nội dung yêu cầu xử lý",
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(height: 1),
                  TaskBoxCustom2(
                      title: "File đính kèm",
                      icon: const Icon(Icons.add, size: 32),
                      //iconPadding: const EdgeInsets.only(right: 2),
                      showItem: true,
                      moveIcon: true,
                      onTap: () {},
                      listItem: []),
                  const SizedBox(height: 1),
                  TaskBoxCustom2(
                    showItem: controller.boolMoreInfo.value,
                    listItem: controller.listMoreInfo.value,
                    title: "Thông tin mở rộng",
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconPadding: const EdgeInsets.only(right: 3),
                    onTap: () {
                      controller.boolMoreInfo.value =
                          !controller.boolMoreInfo.value;
                    },
                  ),
                  const SizedBox(height: 1),
                  TaskBoxCustom2(
                      title: "Người theo dõi",
                      icon: const Icon(Icons.add, size: 32),
                      //iconPadding: const EdgeInsets.only(right: 2),
                      showItem: true,
                      moveIcon: true,
                      onTap: () {},
                      listItem: controller.listFollowers.value),
                  Container(
                    padding: const EdgeInsets.all(16),
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ButtonCustom2(
                            onPressed: () {},
                            text: "Lưu",
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ButtonCustom2(
                            onPressed: () {},
                            text: "Hủy bỏ",
                            textColor: Colors.black,
                            backgroundColor: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildBox(String title) {
    return Container(
        width: double.infinity,
        color: Colors.lightBlue[100],
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          title,
          style: AppTextStyle.titleTextStyle,
        ));
  }
}
