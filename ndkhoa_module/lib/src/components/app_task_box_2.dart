import 'package:flutter/material.dart';
import 'package:ndkhoa_module/src/components/app_task_box.dart';
import 'package:ndkhoa_module/src/core/constants/app_textstyle.dart';

class TaskBoxCustom2 extends StatelessWidget {
  final List<String>? listItem;
  final String title;
  final bool showItem;
  final Icon icon;
  final EdgeInsets? iconPadding;
  final bool moveIcon;
  final Function()? onTap;
  const TaskBoxCustom2({
    super.key,
    required this.title,
    required this.icon,
    this.listItem,
    this.iconPadding,
    this.showItem = false,
    this.moveIcon = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TaskBoxCustom(
      title: title,
      icon: icon,
      iconPadding: iconPadding,
      moveIcon: listItem!.isNotEmpty ? moveIcon : false,
      onTap: onTap,
      children: (showItem && listItem!.isNotEmpty)
          ? [
              const SizedBox(height: 5),
              ListView.builder(
                itemCount: listItem?.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                        left: 16, top: 16, bottom: 16, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          listItem![index],
                          style: AppTextStyle.bodyTextStyle,
                        ),
                        const Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  );
                },
              ),
              if (moveIcon)
                Padding(
                  padding: iconPadding ?? EdgeInsets.zero,
                  child: GestureDetector(
                      onTap: onTap,
                      child:
                          Align(alignment: Alignment.centerRight, child: icon)),
                ),
            ]
          : [],
    );
  }
}
