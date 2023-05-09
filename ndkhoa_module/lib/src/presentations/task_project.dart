import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/dropdown/members_dropdown.dart';
import '../components/dropdown/new_dropdown.dart';
import '../components/tags/tag.dart';
import '../core/theme/app_color.dart';

class TaskProjectScreen extends StatefulWidget {
  const TaskProjectScreen({super.key});

  @override
  State<TaskProjectScreen> createState() => TaskProjectScreenState();
}

class TaskProjectScreenState extends State<TaskProjectScreen> {
  final membersKey = GlobalKey();
  final newKey = GlobalKey();
  double height = 0, xPosition = 0, yPosition = 0;
  bool isDropdownOpened = false;
  OverlayEntry? floatingDropdown;
  String dropdownValue = "";
  bool dropDownCallBack = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'CÔNG VIỆC',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,
                size: 26, color: AppColor.skyBlue)),
        actions: [
          IconButton(
            key: newKey,
            onPressed: () {
              setState(() {
                findDropdownPosition(newKey);
                floatingDropdown =
                    _createFloatingDropdown(-150.0, -20.0, true, 200.0);
                Overlay.of(context).insert(floatingDropdown!);
              });
            },
            icon: SvgPicture.asset(
              'assets/icons/add_icon.svg',
              width: 16,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/search_icon.svg',
              width: 16,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          _buildToolBar(),
          _buildDescribe(),
          _buildInfo(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Danh sách công việc',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sort),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              runSpacing: 5,
              children: [
                _buildContent('assets/avatars/lpb_avatar.png',
                    Tag(late: false, tagName: 'Hoàn thành')),
                _buildContent('assets/avatars/tah_avatar.png',
                    Tag(late: false, tagName: 'Trễ hạn')),
                _buildContent('assets/avatars/nhtn_avatar.png',
                    Tag(late: false, tagName: 'Đang thực hiện')),
                _buildContent('assets/avatars/avatar2.png',
                    Tag(late: false, tagName: 'Chưa thực hiện')),
                _buildContent('assets/avatars/nttt_avatar.png',
                    Tag(late: false, tagName: 'Hoàn thành')),
                _buildContent('assets/avatars/avatar2.png',
                    Tag(late: true, tagName: 'Đang thực hiện')),
              ],
            ),
          )
        ],
      )),
    );
  }

  Container _buildContent(
    String avatar,
    Tag tag,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.9, color: Colors.grey.shade500),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Wrap(
          runSpacing: 10,
          children: [
            Row(
              children: [
                ///avatar
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(avatar),
                ),
                const Spacer(),

                ///Icons
                const Icon(
                  Icons.chat_bubble_outline,
                  color: AppColor.skyBlue,
                  size: 15,
                ),
                const Text(' 2', style: TextStyle(fontSize: 13)),
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.attachment_outlined,
                  color: AppColor.skyBlue,
                  size: 18,
                ),
                const Text(' 1', style: TextStyle(fontSize: 13)),
                const SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  'assets/icons/eye_icon.svg',
                  width: 16,
                ),
                const Text(' 2', style: TextStyle(fontSize: 13)),
              ],
            ),

            ///content
            RichText(
                text: const TextSpan(
                    text:
                        'Báo cáo, họp rà soát liên quan hoạt động nâng cấp phần mềm HSCV',
                    style: TextStyle(
                        height: 1.2,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black))),

            ///border
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1.5, color: Colors.grey.shade400))),
            ),

            ///tag
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tag,
                Text(
                  'Từ: 24/10/2018 đến: 24/10/2018',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey.shade600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildInfo() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey.shade400),
              top: BorderSide(width: 1.0, color: Colors.grey.shade400))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                Text(
                  'Người chủ trì',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(height: 8),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/avatars/avatar2.png'),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Thành viên: ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        'Ngày bắt đầu: ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                      'Ngày kết thúc: ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      key: membersKey,
                      onTap: () {
                        setState(() {
                          findDropdownPosition(membersKey);
                          floatingDropdown = _createFloatingDropdown(
                              -180.0, 0.0, false, 260.0);
                          Overlay.of(context).insert(floatingDropdown!);
                        });
                      },
                      child: const Text(
                        ' 7',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: AppColor.skyBlue),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        ' 24/10/2017',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: AppColor.skyBlue),
                      ),
                    ),
                    const Text(
                      ' 24/10/2018',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: AppColor.skyBlue),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildDescribe() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(
          'Nâng cấp, tích hợp phần mềm QLVB&ĐH, Ý kiến chỉ đạo',
          style: TextStyle(
              fontSize: 13,
              // fontWeight: FontWeight.w500,
              color: Colors.black),
        ));
  }

  Container _buildToolBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.lightBlue.shade100,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(
          'Hồ sơ / Dự án',
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
    );
  }

  OverlayEntry _createFloatingDropdown(
      double x, double y, bool check, double width) {
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
            width: width,
            left: xPosition + x,
            top: yPosition + height + y,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(boxShadow: [
                  // Shadow for dropbox
                  BoxShadow(
                    blurRadius: 25.0,
                    color: Colors.black,
                    spreadRadius: 0.1,
                    offset: Offset(
                      10,
                      10,
                    ),
                  )
                ]),
                child: check
                    ? NewDropDown(
                        triggerRemove: hideDropdown,
                        checkIcon: false,
                        itemHeight: height,
                        selectedItem: dropdownValue,
                        callBack: (value) {
                          setState(() {
                            dropdownValue = value;
                            isDropdownOpened = !isDropdownOpened;
                          });
                          floatingDropdown?.remove();
                        },
                      )
                    : MembersDropDown(
                        itemHeight: height,
                      )),
          ),
        ],
      );
    });
  }

  void findDropdownPosition(GlobalKey key) {
    RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    Offset position = renderBox.localToGlobal(Offset.zero);
    xPosition = position.dx;
    yPosition = position.dy;
  }

  ///Hàm tắt dropdown
  void hideDropdown() {
    floatingDropdown?.remove();
    isDropdownOpened = !isDropdownOpened;
  }
}
