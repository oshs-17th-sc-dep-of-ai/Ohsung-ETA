import 'package:flutter/material.dart';
import 'package:frontend/TempPage.dart';
import 'package:frontend/moldboard.dart';
import 'package:frontend/notices/free.dart';
import 'package:frontend/notices/club.dart';
import 'package:frontend/notices/note.dart';
import 'package:frontend/notices/ask.dart';
import 'package:frontend/notices/graduate.dart';
import 'package:frontend/notices/oneg.dart';
import 'package:frontend/notices/twog.dart';
import 'package:frontend/notices/threeg.dart';
import 'package:frontend/notices/ads.dart';
import 'package:frontend/notices/singo.dart';

import "dart:async";


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '오성고에타',
      home: Loading()
    );
  }
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(130, 173, 252, 1),
      child: Center(
        child: Container(child: Image.asset("img/ohsunggo.png")),
      ),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(130, 173, 252, 1),
        centerTitle: true,
      ),
// email, password 입력하는 부분을 제외한 화면을 탭하면, 키보드 사라지게 GestureDetector 사용
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 50)),
              const Center(
                child: Image(
                  image: AssetImage('img/ohsunggo.png'),
                  width: 100.0,
                ),
              ),
              Form(
                  child: Theme(
                data: ThemeData(
                    primaryColor: Colors.white,
                    inputDecorationTheme: const InputDecorationTheme(
                        labelStyle: TextStyle(
                            color: Color.fromRGBO(130, 173, 252, 1)))),
                child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: Builder(builder: (context) {
                      return Column(
                        children: [
                          TextField(
                            controller: controller,
                            autofocus: true,
                            decoration:
                                const InputDecoration(labelText: 'email'),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: controller2,
                            decoration:
                                const InputDecoration(labelText: 'password'),
                            keyboardType: TextInputType.text,
                            obscureText: true, // 비밀번호 안보이도록 하는 것
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (controller.text == 'ETA' &&
                                      controller2.text == '1234') {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                MoldBoard()));
                                  } else if (controller.text == 'ETA' &&
                                      controller2.text != '1234') {
                                    showSnackBar(
                                        context, const Text('비밀번호가 틀렸습니다.'));
                                  } else {
                                    showSnackBar(
                                        context, const Text('정보를 확인하세요'));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orangeAccent),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ))
                        ],
                      );
                    })),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, Text text) {
  final snackBar = SnackBar(
    content: text,
    backgroundColor: const Color.fromARGB(255, 112, 48, 48),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class NoticeBoard extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"title": "자유", "widget": FreeBoard()},
    {"title": "동아리", "widget": ClubBoard()},
    {"title": "공지", "widget": NoteBoard()},
    {"title": "질문", "widget": AskBoard()},
    {"title": "졸업생", "widget": GraduateBoard()},
    {"title": "1학년", "widget": OnegBoard()},
    {"title": "2학년", "widget": TwogBoard()},
    {"title": "3학년", "widget": ThreegBoard()},
    {"title": "홍보", "widget": AdsBoard()},
    {"title": "피드백", "widget": SingoBoard()},
  ];

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double realwid = screenwidth / 6;
    double screenheight = MediaQuery.of(context).size.height;
    return Column(
        children: [
          Container(
            color: const Color(0xffDCE8FF),
            height: 60.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 90,
                  margin: EdgeInsets.fromLTRB(index == 0 ? 15 : 0, 10, 15, 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => categories[index]["widget"],
                        ),
                      );
                    },
                    child: Text(
                      categories[index]["title"],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: 400,
            height: 60,
            margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Row(
              children: [
                Container(
                  child: const Text(
                    '인기글',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  margin: const EdgeInsets.only(top: 5),
                  child: Image.asset('img/fire.png'),
                ),
              ],
            ),
          ),
          Container(
            width: 400,
            height: 3,
            color: const Color(0xffA0C1FF),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  width: 380,
                  height: (screenheight - 70 - 90 - 25 - 90 - 60),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(10, (index) {
                      return Container(
                        width: 380,
                        height: 90,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(60, 0, 0, 0),
                              width: 1),
                          color: const Color(0xffEFEFEF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () {
                            //해당게시물로 가기
                            print('hello');
                          },
                          child: const Text(''),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
    );
  }
}
