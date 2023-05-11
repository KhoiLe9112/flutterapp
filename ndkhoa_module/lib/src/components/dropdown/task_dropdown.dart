import 'package:flutter/material.dart';
import 'package:ndkhoa_module/src/components/dropdown/dropdown_items.dart';
import 'package:ndkhoa_module/src/core/const/text_const.dart';
import 'package:ndkhoa_module/src/core/theme/app_color.dart';

class TaskDropDown extends StatelessWidget {
  final double itemHeight;
  final String selectedItem;
  final Function() triggerRemove;
  ValueSetter<String> callBack;
  final bool checkIcon;
  List<String> dropCountryData = <String>[
    AppText.viecCuaToi,
    AppText.viecPhongban,
    AppText.viecCoQuan
  ];

  TaskDropDown(
      {Key? key,
      required this.itemHeight,
      required this.selectedItem,
      required this.triggerRemove,
      required this.checkIcon,
      required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ///sizedbox dùng cho khoảng cách nhỏ <5
        const SizedBox(
          height: 5.0,
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
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      triggerRemove();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 25.0),
                      child: Row(
                        children: [
                          const Text(
                            AppText.congViec,
                            style: TextStyle(
                                color: AppColor.darkBlue,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(flex: 1),
                          Icon(Icons.arrow_drop_up, color: Colors.grey.shade700,)
                        ],
                      ),
                    ),
                  ),
                  DropDownItem(
                      checkIcon: checkIcon,
                      text: dropCountryData[0],
                      isSelected: selectedItem == dropCountryData[0],
                      callBack: callBack,
                      isFirstItem: true),
                  DropDownItem(
                    checkIcon: checkIcon,
                    text: dropCountryData[1],
                    isSelected: selectedItem == dropCountryData[1],
                    callBack: callBack,
                  ),
                  DropDownItem(
                    checkIcon: checkIcon,
                    text: dropCountryData[2],
                    isSelected: selectedItem == dropCountryData[2],
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