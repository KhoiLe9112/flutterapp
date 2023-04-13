import 'package:flutter/material.dart';
import 'package:qlvbdh/src/components/textfield_custom1.dart';

import '../components/app_button.dart';
import '../core/theme/app_color.dart';

class TextSearchScreen extends StatefulWidget {
  const TextSearchScreen({super.key});

  @override
  State<TextSearchScreen> createState() => _TextSearchScreenState();
}

class _TextSearchScreenState extends State<TextSearchScreen> {
  ///variables
  DateTime _dateTimeFrom = DateTime.now();
  DateTime _dateTimeTo = DateTime.now();
  final items = ['Item1', 'Item2', 'Item3'];
  String? itemValue;

  ///funtions
  ///show date picker
  Future<DateTime?> _showDayPicker(BuildContext context) {
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2014),
        lastDate: DateTime(2024));
  }

  ///menu items
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'TÌM KIẾM VĂN BẢN',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,
                size: 26, color: AppColor.skyBlue)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Wrap(
                runSpacing: 2.0,
                children: [
                  ///Nhap van ban
                  _buildInputTextField(),

                  ///Chon ngay
                  Container(
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          _buildDatePickerFrom(context),
                          _buildDatePickerTo(context)
                        ],
                      ),
                    ),
                  ),
                  _buildDropDownMenu('Loại văn bản'),
                  _buildDropDownMenu('Lĩnh vực'),
                  _buildDropDownMenu('Cơ quan ban hành'),
                  _buildDropDownMenu('Loại văn bản'),
                  _buildDropDownMenu('Người xử lý'),
                  _buildDropDownMenu('Người thụ lý'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              _buildSearchButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Container _buildInputTextField() {
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
                  'Trích yếu',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const TextField(
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildDatePickerTo(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Đến ngày',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
                color: Colors.white,
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_dateTimeTo.day}/${_dateTimeTo.month}/${_dateTimeTo.year}",
                      style: const TextStyle(fontSize: 14),
                    ),
                    GestureDetector(
                        onTap: () async {
                          _dateTimeTo = (await _showDayPicker(context))!;
                          setState(() {
                            _dateTimeTo;
                          });
                        },
                        child: const Icon(
                          Icons.calendar_month_outlined,
                          size: 18,
                        )),
                  ],
                )),
          )
        ],
      ),
    ));
  }

  Expanded _buildDatePickerFrom(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Từ ngày',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
                color: Colors.white,
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_dateTimeFrom.day}/${_dateTimeFrom.month}/${_dateTimeFrom.year}",
                      style: const TextStyle(fontSize: 14),
                    ),
                    GestureDetector(
                        onTap: () async {
                          _dateTimeFrom = (await _showDayPicker(context))!;
                          setState(() {
                            _dateTimeFrom;
                          });
                        },
                        child: const Icon(
                          Icons.calendar_month_outlined,
                          size: 18,
                        )),
                  ],
                )),
          )
        ],
      ),
    ));
  }

  Container _buildDropDownMenu(String text) {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: DropdownButton<String>(
          isExpanded: true,
          value: itemValue,
          iconSize: 22,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map(buildMenuItem).toList(),
          hint: Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          onChanged: (value) => setState(() {
            itemValue = value;
          }),
        ),
      ),
    );
  }

  Padding _buildSearchButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AppButton(
        text: 'Tìm kiếm',
        backColor: AppColor.skyBlue,
        textColor: Colors.white,
        radius: 24,
      ),
    );
  }
}
