import 'package:flutter/material.dart';
import 'package:ndkhoa_module/src/core/theme/app_color.dart';

class DropDownItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isFirstItem;
  final bool checkIcon;
  // final bool isLastItem;
  ///được gọi ở dropdown.dart
  ValueSetter<String> callBack;

  DropDownItem(
      {super.key,
      required this.text,
      this.isSelected = false,
      this.isFirstItem = false,
      this.checkIcon = false,
      // this.isLastItem = false,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //return value
        callBack(text);
      },
      child: Container(
        color: isSelected ? AppColor.greyColor : Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: isSelected
            ? Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 25.0,
                      child: Visibility(
                        visible: checkIcon,
                        child: const Icon(
                          Icons.check,
                          color: AppColor.skyBlue,
                          size: 24,
                        ),
                      ),
                    ),
                    Text(
                      text,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              )
            : Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
      ),
    );
  }
}
