import 'package:flutter/material.dart';
import 'package:qlvbdh/src/const/text_const.dart';
import 'package:qlvbdh/src/theme/app_colors.dart';

import 'dropdown_items.dart';

class DropDown extends StatelessWidget {
  final double itemHeight;
  final String selectedItem;
  ValueSetter<String> callBack;
  List<String> dropCountryData = <String>[
    AppText.viecCuaToi,
    AppText.viecPhongban,
    AppText.viecCoQuan
  ];

  DropDown(
      {Key? key,
      required this.itemHeight,
      required this.selectedItem,
      required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 5,
        ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 20.0),
                    child: Row(
                      children: const [
                        Text(
                          AppText.congViec,
                          style: TextStyle(
                              color: AppColors.navyColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                  DropDownItem(
                      text: dropCountryData[0],
                      isSelected: selectedItem == dropCountryData[0],
                      callBack: callBack,
                      isFirstItem: true),
                  DropDownItem(
                    text: dropCountryData[1],
                    isSelected: selectedItem == dropCountryData[1],
                    callBack: callBack,
                  ),
                  DropDownItem(
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
