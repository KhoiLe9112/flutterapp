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
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          // gradient: isSelected
          //     ? AppColors.bgGradient
          //     : const LinearGradient(colors: [Colors.white, Colors.white]),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                color: isSelected ? Colors.white : AppColors.textColor,
                fontSize: 14),
          ),
        ),
      ),
    );
  }
}
