import 'package:flutter/material.dart';

import '../../core/theme/app_color.dart';

class Tag extends StatelessWidget {
  // constructor
  String tagName;
  bool late;

  Tag({required this.tagName, required this.late, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      color: _checkTagsColor(tagName),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(tagName,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            if (late)
              const Text('(Trễ hạn)',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white))
          ],
        ),
      ),
    );
  }

  // private functions
  Color _checkTagsColor(String tagName) {
    switch (tagName) {
      case "Đang thực hiện":
        return AppColor.greenColor;
      case "Chưa thực hiện":
        return AppColor.darkGrey;
      case "Hoàn thành":
        return AppColor.skyBlue;
      case "Trễ hạn":
        return AppColor.redColor;
      default: 
        return AppColor.lightBlue;
    }
  }
}
