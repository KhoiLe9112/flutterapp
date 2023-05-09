import 'package:flutter/material.dart';
import 'package:ndkhoa_module/src/core/constants/app_textstyle.dart';

class TaskBoxCustom extends StatelessWidget {
  final String title;
  final Icon? icon;
  final EdgeInsets? iconPadding;
  final bool moveIcon;
  final Function()? onTap;
  //final bool showChildren;
  final List<Widget> children;
  const TaskBoxCustom({
    super.key,
    required this.title,
    this.icon,
    this.iconPadding,
    this.moveIcon = false,
    this.onTap,
    //this.showChildren = true,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: AppTextStyle.titleTextStyle),
                  if (moveIcon == false && icon != null)
                    Padding(
                      padding: iconPadding ?? EdgeInsets.zero,
                      child: GestureDetector(onTap: onTap, child: icon),
                    ),
                ],
              ),
            ] +
            children,
      ),
    );
  }
}
