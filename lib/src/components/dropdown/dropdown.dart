import 'package:flutter/material.dart';

import 'dropdown_items.dart';

class DropDown extends StatelessWidget {
  final double itemHeight;
  final String selectedItem;
  ValueSetter<String> callBack;
  List<String> dropCountryData = <String>[
    'VietNam',
    'ThaiLan',
    'Campuchia',
    'Indo',
    'Sing'
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
            height: dropCountryData.length * itemHeight + 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 0.1,
                    offset: const Offset(0, 0.1)),
              ],
            ),
            child: Column(
              children: <Widget>[
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
                DropDownItem(
                  text: dropCountryData[3],
                  isSelected: selectedItem == dropCountryData[3],
                  callBack: callBack,
                ),
                DropDownItem(
                    text: dropCountryData[4],
                    isSelected: selectedItem == dropCountryData[4],
                    callBack: callBack,
                    isLastItem: true),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
