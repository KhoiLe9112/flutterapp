import 'package:flutter/material.dart';
import 'package:qlvbdh/src/components/dropdown/dropdown_items.dart';
import 'package:qlvbdh/src/core/const/text_const.dart';
import 'package:qlvbdh/src/core/theme/app_color.dart';

class SortDropDown2 extends StatefulWidget {
  final double itemHeight;
  final String selectedItem;
  ValueSetter<String> callBack;
  final bool checkIcon;
  final Function() triggerRemove;

  List<String> dropCountryData2 = <String>[
    AppText.tangDan,
    AppText.giamDan,
  ];

  SortDropDown2(
      {Key? key,
      required this.itemHeight,
      required this.selectedItem,
      required this.checkIcon,
      required this.triggerRemove,
      required this.callBack})
      : super(key: key);

  @override
  State<SortDropDown2> createState() => _SortDropDown2State();
}

class _SortDropDown2State extends State<SortDropDown2> {
  late String selectedItem;
  @override
  void initState() {
    selectedItem = widget.selectedItem;
    super.initState();
  }

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
                        widget.triggerRemove();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 4.0, bottom: 4.0, left: 20.0),
                        child: Row(
                          children: [
                            const Text(
                              AppText.sapXep,
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
                      checkIcon: widget.checkIcon,
                      text: widget.dropCountryData2[0],
                      isSelected: selectedItem == widget.dropCountryData2[0],
                      callBack: (value) {
                        widget.callBack.call(value);
                        setState(() {
                          selectedItem = widget.dropCountryData2[0];
                        });
                      },
                      isFirstItem: true),
                  DropDownItem(
                    checkIcon: widget.checkIcon,
                    text: widget.dropCountryData2[1],
                    isSelected: selectedItem == widget.dropCountryData2[1],
                    callBack: (value) {
                      setState(() {
                        selectedItem = widget.dropCountryData2[1];
                      });
                    },
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