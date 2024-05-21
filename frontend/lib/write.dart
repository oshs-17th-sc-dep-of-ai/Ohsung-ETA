import 'package:flutter/material.dart';

class WriteBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '글 쓰기',
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

          leadingWidth: 100,
        ),
        body: mollu());
  }
}

class mollu extends StatefulWidget {
  @override
  _helloState createState() => _helloState();
}

class _helloState extends State<mollu> {
  final _valueList = [
    '자유',
    '동아리',
    '공지',
    '질문',
    '졸업생',
    '1학년',
    '2학년',
    '3학년',
    '홍보',
    '피드백'
  ];
  var _selectedValue = '자유';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                width: 400,
                margin: const EdgeInsets.fromLTRB(7, 20, 5, 0),
                color: const Color.fromARGB(255, 214, 235, 250),
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                      isExpanded: true,
                      dropdownColor: const Color.fromARGB(255, 214, 235, 250),
                      value: _selectedValue,
                      items: _valueList.map(
                        (value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
