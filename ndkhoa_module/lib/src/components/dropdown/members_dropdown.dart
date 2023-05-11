import 'package:flutter/material.dart';

class MembersDropDown extends StatelessWidget {
  final double itemHeight;
  // final Function() triggerRemove;
  // ValueSetter<String> callBack;
  List<String> membersAvatarData = <String>[
    'lpb_avatar.png',
    'nhtn_avatar.png',
    'nttt_avatar.png',
    'avatar2.png',
    'tah_avatar.png',
    'ntm_avatar.png',
    'pvh_avatar.png',
  ];
  List<String> membersNameData = <String>[
    'Lê Phước Bình',
    'Nguyễn Hữu Thành Nam',
    'Nguyễn Thị Thu Thủy',
    'Nguyễn Văn Tình',
    'Trần Anh Hiền',
    'Nguyễn Thành Mẫn',
    'Phùng Văn Hòa',
  ];

  MembersDropDown({
    Key? key,
    required this.itemHeight,
    // required this.triggerRemove,
    // required this.callBack
  }) : super(key: key);

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
            child: SizedBox(
              height: 320.0,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 15.0),
                  itemCount: membersAvatarData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                                'assets/avatars/${membersAvatarData[index]}'),
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            membersNameData[index],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
