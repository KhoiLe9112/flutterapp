import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ndkhoa_module/src/components/tags/tag.dart';

import '../core/theme/app_color.dart';

class ChildTask extends StatefulWidget {
  const ChildTask({super.key});

  @override
  State<ChildTask> createState() => _ChildTaskState();
}

class _ChildTaskState extends State<ChildTask> {
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
            onPressed: () {},
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
      body: Stack(
        children: [
          ///background
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/backgrounds/background1.png'),
                    fit: BoxFit.fill)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _buildToolBar(),
                const SizedBox(
                  height: 10,
                ),
                _buildContent(
                  'assets/avatars/avatar2.png',
                  Tag(late: false, tagName: 'Hoàn thành'),
                  'Hoàn thiện Cổng dịch vụ công trực tuyến đảm bảo đồng bộ, liên thông, an toàn, an ninh hệ thống; tăng cường phối hợp với Trung tâm Hành chính công tỉnh, tổng hợp các góp ý của công dân, tổ chức để hoàn thiện phiên bản Cổng dịch vụ công trực tuyến 1.0 trong quý I.',
                ),
                _buildContent(
                  'assets/avatars/avatar1.png',
                  Tag(late: false, tagName: 'Đang thực hiện'),
                  'Chủ động, tập trung hoàn thiện các khung, nền tảng công nghệ đang được nhiều nhóm tư vấn nghiên cứu, đảm bảo các giải pháp để phát triển hệ thống công nghệ thông tin của tỉnh theo hướng tiên tiến và phù hợp các quy định, hướng dẫn của các bộ ngành trung ương; quản lý toàn vẹn bản quyền các sản phẩm để phục vụ nâng cấp, phát triển hệ thống',
                ),
                _buildContent(
                  'assets/avatars/avatar2.png',
                  Tag(late: false, tagName: 'Trễ hạn'),
                  'Hoàn thiện Cổng dịch vụ công trực tuyến đảm bảo đồng bộ, liên thông, an toàn, an ninh hệ thống; tăng cường phối hợp với Trung tâm Hành chính công tỉnh, tổng hợp các góp ý của công dân, tổ chức để hoàn thiện phiên bản Cổng dịch vụ công trực tuyến 1.0 trong quý I.',
                ),
                _buildContent(
                  'assets/avatars/avatar1.png',
                  Tag(late: false, tagName: 'Chưa thực hiện'),
                  'Chủ động, tập trung hoàn thiện các khung, nền tảng công nghệ đang được nhiều nhóm tư vấn nghiên cứu, đảm bảo các giải pháp để phát triển hệ thống công nghệ thông tin của tỉnh theo hướng tiên tiến và phù hợp các quy định, hướng dẫn của các bộ ngành trung ương; quản lý toàn vẹn bản quyền các sản phẩm để phục vụ nâng cấp, phát triển hệ thống',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding _buildContent(
    String avatar,
    Tag tag,
    String content,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
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

                  ///Tag
                  tag
                ],
              ),

              ///content
              RichText(
                  text: TextSpan(
                      text: content,
                      style: const TextStyle(
                          height: 1.2,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black))),

              ///date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '24/10/2018',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColor.skyBlue),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.chat_bubble_outline,
                        color: AppColor.skyBlue,
                        size: 15,
                      ),
                      Text(' 2', style: TextStyle(fontSize: 13)),
                      SizedBox(
                        width: 25,
                      ),
                      Icon(
                        Icons.attachment_outlined,
                        color: AppColor.skyBlue,
                        size: 18,
                      ),
                      Text(' 1', style: TextStyle(fontSize: 13)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildToolBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.lightBlue.shade100,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(
          'Công việc con',
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
    );
  }
}
