import 'package:flutter/material.dart';

import '../../components/dropdown/dropdown.dart';

class PersonalTaskScreen extends StatefulWidget {
  const PersonalTaskScreen({super.key});

  @override
  State<PersonalTaskScreen> createState() => _PersonalTaskScreenState();
}

class _PersonalTaskScreenState extends State<PersonalTaskScreen> {
  int total = 350;
  int exchange = 12;
  int unfulfilled = 12;
  int processing = 12;
  int monitor = 12;
  int complete = 12;
  int waiting = 12;
  int opinion = 12;

  GlobalKey? actionKey;
  double height = 0, width = 0, xPosition = 0, yPosition = 0;
  bool isDropdownOpened = false;
  OverlayEntry? floatingDropdown;

    @override
  void initState() {
    actionKey = LabeledGlobalKey("widget.country");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'CÔNG VIỆC',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w300, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:
                Icon(Icons.arrow_back, size: 40, color: Colors.blue.shade800)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 40, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 40, color: Colors.black),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Group 137.png'),
                    fit: BoxFit.fill)),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.lightBlue.shade100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 25),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Text(
                              'Việc của tôi',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )),
                        // IconButton(
                        //   icon: Image.asset('assets/arrow_down_icon.png', fit: BoxFit.fill,),
                        //   onPressed: () {},
                        // ),
                        GestureDetector(
                          key: actionKey,
                            onTap: () {
                            
                              setState(() {
                                if (isDropdownOpened) {
                                  floatingDropdown?.remove();
                                } else {
                                  findDropdownPosition();
                                  floatingDropdown = _createFloatingDropdown();
                                  Overlay.of(context)
                                      ?.insert(floatingDropdown!);
                                }
                                isDropdownOpened = !isDropdownOpened;
                              });
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFF007FEB),
                              size: 40,
                            )),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 25, top: 20, bottom: 20),
                            child: RichText(
                                text: TextSpan(children: [
                              const TextSpan(
                                text: 'Tổng số ',
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: total.toString(),
                                style: const TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ]))),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildBox('Trao đổi', exchange, 0xFF00E3EB),
                _buildBox('Chưa thực hiện', unfulfilled, 0xFFFFC400),
                _buildBox('Đang thực hiện', processing, 0xFF007FEB),
                _buildBox('Theo dõi', monitor, 0xFFF388F0),
                _buildBox('Hoàn thành', complete, 0xFF4CA2E8),
                _buildBox('Chờ xác nhận', waiting, 0xFFAA40B9),
                _buildBox('Xin ý kiến ban hành', opinion, 0xFFE34E9E),
                _buildBox('Tất cả', total, 0xFF3550C8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void findDropdownPosition() {
    RenderBox? renderBox =
        actionKey?.currentContext?.findRenderObject() as RenderBox?;
    height = renderBox?.size.height ?? 0;
    width = renderBox?.size.width ?? 0;
    Offset? offset = renderBox?.localToGlobal(Offset.zero);
    xPosition = offset?.dx ?? 0;
    yPosition = offset?.dy ?? 0;
    print(height);
    print(width);
    print(xPosition);
    print(yPosition);
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Stack(
        children: [
          //For tap outside overlay to dismiss
          Positioned.fill(
              child: GestureDetector(
            onTap: () {
              floatingDropdown?.remove();
              isDropdownOpened = !isDropdownOpened;
            },
            child: Container(
              color: Colors.transparent,
            ),
          )),
          //position of Overlay
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: yPosition + height,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: DropDown(
                itemHeight: height,
                selectedItem: "",
                callBack: (value) => {},
              ),
            ),
          ),
        ],
      );
    });
  }

  void hideDropdown() {
    floatingDropdown?.remove();
    isDropdownOpened = !isDropdownOpened;
  }

  Widget _createHeader() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 0.1,
                offset: const Offset(0, 0.1)),
          ],
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Text(
            "widget.country",
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
          const Spacer(),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Padding _buildBox(String text, int data, int color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                const Icon(
                  Icons.alarm,
                  size: 45,
                  color: Color(0xFF707070),
                ),
                const SizedBox(
                  width: 18,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(color)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.toString(),
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
