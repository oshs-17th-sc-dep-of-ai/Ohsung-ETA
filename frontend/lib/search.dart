import 'package:flutter/material.dart';

class Searching extends StatelessWidget {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Flexible(
              flex: 1,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  border: InputBorder.none,
                  hintText: '게시판 검색',
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: () {
                //여기가 누르면 검색 결과 나오게 하는 버튼
              },
              child: const Text('검색'),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            width: 400,
            height: 4,
            color: const Color.fromARGB(255, 130, 173, 252),
          ),
        ],
      ),
    );
  }
}
