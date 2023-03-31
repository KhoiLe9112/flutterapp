import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class DropDownItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;
  ValueSetter<String> callBack;

  DropDownItem(
      {super.key,
      required this.text,
      this.isSelected = false,
      this.isFirstItem = false,
      this.isLastItem = false,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //return value
        callBack(text);
      },
      child: Container(
        color: isSelected ? AppColors.greyColor : Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
