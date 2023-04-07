import 'package:flutter/material.dart';
import 'package:qlvbdh/src/components/dropdown/dropdown_items.dart';
import 'package:qlvbdh/src/core/const/text_const.dart';
import 'package:qlvbdh/src/core/theme/app_color.dart';

class SortDropDown extends StatelessWidget {
  final double itemHeight;
  final String selectedItem1;
  final String selectedItem2;
  ValueSetter<String> callBack;
  final bool checkIcon;
  final Function() triggerRemove;
  List<String> dropCountryData1 = <String>[
    AppText.theoNgayGiaoViec,
    AppText.theoNgayHetHan,
  ];
  List<String> dropCountryData2 = <String>[
    AppText.tangDan,
    AppText.giamDan,
  ];

  SortDropDown(
      {Key? key,
      required this.itemHeight,
      required this.selectedItem1,
      required this.selectedItem2,
      required this.triggerRemove,
      required this.checkIcon,
      required this.callBack
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ///sizedbox dùng cho khoảng cách nhỏ <5
        const SizedBox(
          height: 5,
        ),

        ///material giống container
        Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 0.1)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      triggerRemove();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            AppText.sapXep,
                            style: TextStyle(
                                color: AppColor.darkBlue,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_drop_up,
                            color: Colors.grey.shade700,
                          )
                        ],
                      ),
                    ),
                  ),
                  DropDownItem(
                      checkIcon: checkIcon,
                      text: dropCountryData1[0],
                      isSelected: selectedItem1 == dropCountryData1[0],
                      callBack: callBack,
                      isFirstItem: true),
                  DropDownItem(
                    checkIcon: checkIcon,
                    text: dropCountryData1[1],
                    isSelected: selectedItem1 == dropCountryData1[1],
                    callBack: callBack,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1.0, color: Colors.black))),
                  ),
                  DropDownItem(
                    checkIcon: checkIcon,
                      text: dropCountryData2[0],
                      isSelected: selectedItem2 == dropCountryData2[0],
                      callBack: callBack,
                      isFirstItem: true),
                  DropDownItem(
                    checkIcon: checkIcon,
                    text: dropCountryData2[1],
                    isSelected: selectedItem2 == dropCountryData2[1],
                    callBack: callBack,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
