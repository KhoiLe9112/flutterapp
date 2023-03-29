import 'package:flutter/material.dart';
import 'package:qlvbdh/src/presentations/text_details.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
          backgroundColor: Colors.white,
          // backgroundColor: Colors.deepPurple.shade400,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 40,
                color: Colors.blue.shade800,
              ))),
      body: Column(
        children: [
          ///Mo ta
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 40, left: 70),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Loại văn bản: Công văn',
                    style: TextStyle(fontSize: 23),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 70, bottom: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cơ quan ban hành: UBND tỉnh Thừa Thiên Huế',
                    style: TextStyle(fontSize: 23),
                  ),
                ),
              ),
            ],
          ),

          Container(
            color: Colors.lightBlue.shade100,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Kết quả tìm kiếm\n',
                          style: TextStyle(
                              height: 1.3,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Tổng số: 15',
                          style: TextStyle(
                              height: 1.3,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                        ),
                      ]),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TextDetailsScreen()));
                      },
                      child: const Icon(
                        Icons.sort,
                        size: 40,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
