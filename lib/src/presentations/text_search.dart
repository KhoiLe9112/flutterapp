
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
      lastDate: DateTime(2024)
    );
  }
  ///menu items
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(
        fontSize: 32
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'CHI TIẾT  VĂN BẢN',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            color: Colors.black
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back, size: 40, color: Colors.blue.shade800)
        )
      ),

      body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Nhap van ban
            _buildInputTextField(),
            ///Chon ngay
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
              child: Container(
                color: Colors.grey.shade300,
                child: Row(
                  children: [
                    _buildDatePickerFrom(context),
                    _buildDatePickerTo(context)
                  ],
                ),
              ),
            ),
            Column(
              children: [
                _buildDropDownMenu('Loại văn bản'),
                _buildDropDownMenu('Lĩnh vực'),
                _buildDropDownMenu('Cơ quan ban hành'),
                _buildDropDownMenu('Loại văn bản'),
                _buildDropDownMenu('Người xử lý'),
                _buildDropDownMenu('Người thụ lý'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            _buildSearchButton(context)
          ],
        ),
      );
  }

  Padding _buildInputTextField() {
    return Padding(
            padding: const EdgeInsets.fromLTRB(25, 35, 25, 5),
            child: Container(
              color: Colors.grey.shade300,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Trích yếu',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 10, 25, 27),
                    child: TextFieldCustom1()
                  )
                ],
              ),
            ),
          );
  }

  Expanded _buildDatePickerTo(BuildContext context) {
    return Expanded(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Đến ngày',
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                        ),
                        Padding(
                        padding: const EdgeInsets.fromLTRB(7, 10, 25, 27),
                          child: Container(
                            color: Colors.white,
                            height: 60,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${_dateTimeTo.day}/${_dateTimeTo.month}/${_dateTimeTo.year}",
                                  style: const TextStyle(
                                    fontSize: 22
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async{
                                    _dateTimeTo = (await _showDayPicker(context))!;
                                    setState(() {
                                      _dateTimeTo;
                                    });
                                  },
                                  child: const Icon(Icons.calendar_month_outlined, size: 32,)),
                              ],
                            )
                          ),
                        )
                      ],
                    )
                  );
  }

  Expanded _buildDatePickerFrom(BuildContext context) {
    return Expanded(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                          'Từ ngày',
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 10, 7, 27),
                          child: Container(
                            color: Colors.white,
                            height: 60,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${_dateTimeFrom.day}/${_dateTimeFrom.month}/${_dateTimeFrom.year}",
                                  style: const TextStyle(
                                    fontSize: 22
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async{
                                    _dateTimeFrom = (await _showDayPicker(context))!;
                                    setState(() {
                                      _dateTimeFrom;
                                    });
                                  },
                                  child: const Icon(Icons.calendar_month_outlined, size: 32,)),
                              ],
                            )
                          ),
                        )
                      ],
                    )
                  );
  }

  Padding _buildDropDownMenu(String text) {
    return Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 5),
                child: Container(
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 14, 25, 14),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: itemValue,
                      iconSize: 36,
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      items: items.map(buildMenuItem).toList(),
                      hint: Text(
                        text,
                        style: const TextStyle(
                          fontSize: 32,
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        itemValue = value;
                      }),
                    ),
                  ),
                ),
              );
  }

  Padding _buildSearchButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: AppButton(text: 'Tìm kiếm', backColor: AppColor.darkBlue, textColor: Colors.white),
    );
  }
}

