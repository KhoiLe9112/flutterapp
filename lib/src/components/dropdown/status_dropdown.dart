import 'package:flutter/material.dart';
import 'package:qlvbdh/src/components/dropdown/dropdown_items.dart';
import 'package:qlvbdh/src/core/const/text_const.dart';
import 'package:qlvbdh/src/core/theme/app_color.dart';

class StatusDropDown extends StatelessWidget {
  final double itemHeight;
  final String selectedItem;
  ValueSetter<String> callBack;
  final bool checkIcon;
  final Function() triggerRemove;
  final isSelected;
  List<String> dropCountryData1 = <String>[
    AppText.traoDoi,
    AppText.chuaThucHien,
    AppText.dangThucHien,
    AppText.hoanThanh,
    AppText.choXacNhan,
    AppText.xinYKienBanHanh,
    AppText.theoDoi,
  ];

  StatusDropDown(
      {Key? key,
      this.isSelected,
      required this.itemHeight,
      required this.selectedItem,
      required this.checkIcon,
      required this.triggerRemove,
      required this.callBack})
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
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1.0, color: Colors.grey.shade500))),
                    child: GestureDetector(
                      onTap: () {
                        triggerRemove();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 4.0, bottom: 4.0, left: 20.0),
                        child: Row(
                          children: [
                            const Text(
                              AppText.trangThai,
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
                  ),
                  DropDownItem(
                      checkIcon: checkIcon,
                      text: dropCountryData1[0],
                      isSelected: isSelected,
                      callBack: callBack,
                      isFirstItem: true),
                  DropDownItem(
                    checkIcon: checkIcon,
                    text: dropCountryData1[1],
                    isSelected: selectedItem == dropCountryData1[1],
                    callBack: callBack,
                  ),
                  DropDownItem(
                    checkIcon: checkIcon,
                    text: dropCountryData1[2],
                    isSelected: selectedItem == dropCountryData1[2],
                    callBack: callBack,
                  ),
                  DropDownItem(
                    checkIcon: checkIcon,
                    text: dropCountryData1[3],
                    isSelected: selectedItem == dropCountryData1[3],
                    callBack: callBack,
                  ),
                  DropDownItem(
                    checkIcon: checkIcon,
                    text: dropCountryData1[4],
                    isSelected: selectedItem == dropCountryData1[4],
                    callBack: callBack,
                  ),
                  DropDownItem(
                    checkIcon: checkIcon,
                    text: dropCountryData1[5],
                    isSelected: selectedItem == dropCountryData1[5],
                    callBack: callBack,
                  ),
                  DropDownItem(
                    checkIcon: checkIcon,
                    text: dropCountryData1[6],
                    isSelected: selectedItem == dropCountryData1[6],
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
