import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/lunch.dart';
import 'package:frontend/main.dart';
import 'package:frontend/score.dart';

class MoldBoard extends StatefulWidget {
  MoldBoard({ 
    super.key,
  });

  @override
  State<MoldBoard> createState() => _MoldBoardState();
}

class _MoldBoardState extends State<MoldBoard> {

  int _selectedIndex = 2;
  
  final List<Widget> _widgetOptions = <Widget>[
    Container(),
    showLunch(),
    NoticeBoard(),
    firstScoreboard(),
    Container()
  ];

  final List<String> _titleText = <String> [
    "임시",
    "급식",
    "게시판",
    "성적 계산기",
    "임시"
  ];
 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double realwid = screenwidth / 6;
    return Scaffold(
      appBar: AppBar(     
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            color: Colors.black,
            height: 4.0,
          ),
        ),


        
        toolbarHeight: 90,
        title : Text(_titleText[_selectedIndex],style: TextStyle(fontSize: 30,color: Colors.black),),
        centerTitle: true,
        leadingWidth: 135,
        leading: Container(
          margin: const EdgeInsets.only(left: 50),
          child: Image.asset(
            'img/ohsunggo.png',
          ),
        ),
      ),

      
      body: _widgetOptions[_selectedIndex],


      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: '시간표'
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.bento_outlined),
            label: '급식'
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            label: '게시판'
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.grade_outlined),
            label: '성적'
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: '마이페이지',
            ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      )
    );
  }
}