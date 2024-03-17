import 'package:flutter/material.dart';
import 'package:frontend/search.dart';
import 'package:frontend/write.dart';

class ThreegBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '3학년게시판',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Searching(),
                ),
              );
            },
            icon: Icon(Icons.search, color: Colors.black, size: 30),
          ),
          SizedBox(width: 20)
        ],
        elevation: 0.0,
        toolbarHeight: 65,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: 20, // 게시물 개수에 맞게 수정
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 380,
            height: 90,
            margin: EdgeInsets.only(top: index == 0 ? 0 : 20),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(60, 0, 0, 0), width: 1),
              color: Color(0xffEFEFEF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                // 해당 게시물로 가기
                print('hello');
              },
              child: Text(''),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WriteBoard(),
            ),
          );
        },
        child: Icon(Icons.note_alt_outlined),
        backgroundColor: Color.fromARGB(255, 130, 173, 252),
      ),
    );
  }
}
