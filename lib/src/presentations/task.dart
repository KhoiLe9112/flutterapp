import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  color: Colors.lightBlue.shade100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                            GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xFF007FEB),
                                  size: 40,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.filter_alt_sharp,
                                  color: Colors.black,
                                  size: 38,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.sort,
                                  color: Colors.black,
                                  size: 38,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1.0, color: Colors.grey.shade400))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Column(
                      children: [
                        RichText(
                            text: const TextSpan(
                                text:
                                    '[QLVBYKCD&DH] - 45/TB-UBND - Kết luận của Phó Chủ tịch Thường trực UBND tỉnh tại buổi làm việc về Cổng dịch vụ',
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black))),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '24/10/2018',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Colors.blue.shade400
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.chat_bubble_outline, color: Colors.blue.shade400, size: 25,),
                                const Text(' 2', style: TextStyle(fontSize: 24)),
                                const SizedBox(width: 25,),
                                Icon(Icons.attachment_outlined, color: Colors.blue.shade400, size: 29,),
                                const Text(' 1', style: TextStyle(fontSize: 24)),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
