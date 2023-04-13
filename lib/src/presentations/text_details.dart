import 'package:flutter/material.dart';

import '../core/theme/app_color.dart';

class TextDetailsScreen extends StatelessWidget {
  const TextDetailsScreen({super.key});

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
      ),

    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          _buildText("Số/ký hiệu gốc", "2377/STC-QLGCS"),
          _buildBorder(),
    
          _buildText("Ngày ban hành", "24/09/2018"),
          _buildBorder(),
    
          _buildText("Trích yếu", "Về việc góp ý cho dự thảo Quyết định Ban hành Quy chế mua sắm tài sản nhà nước theo phương thức tập trung và danh mục tài sản MSTT"),
          _buildBorder(),
    
          _buildLink(),
          _buildBorder(),
    
          _buildText("Ngày dến", "24/09/2018"),
          _buildBorder(),
    
          _buildText("Ngày vào sổ", "24/09/2018"),
          _buildBorder(),

          const SizedBox(
            height: 20,
          )
        ],
      ),
    ),
    );
  }

  Align _buildLink() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'File đính kèm\n',
                  style: TextStyle(
                    height: 1.8,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
                TextSpan(
                  text: 'ubnd-2250-qg-ubnd2018-signed! 2018-10-11_11-32-10.636.pdf UBND-2250-QD-UBND-2018! 2018-10-11_11-32-10-642.docx',
                  style: TextStyle(
                    height: 1.8,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue.shade400
                  ),
                ),
              ]
            ),
          ),
        ),
      );
  }

  Padding _buildBorder() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.5, color: Colors.grey.shade400))),
        ),
      );
  }

  Align _buildText(String title, String content) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$title\n',
                  style: const TextStyle(
                    height: 1.8,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
                TextSpan(
                  text: content,
                  style: const TextStyle(
                    height: 1.8,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black
                  ),
                ),
              ]
            ),
          ),
        ),
      );
  }
}