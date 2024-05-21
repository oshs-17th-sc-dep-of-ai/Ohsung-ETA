import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "dart:async";
import "dart:convert";

import "package:http/http.dart" as http;

Future<dynamic> httpGet(String url) async {
  final uri = Uri.parse(url);
  final response = await http.get(uri);

  return jsonDecode(response.body);
}

Future<Map<String, List>> getDiet(String apiKey) async {
  // N10 교육청 코드
  // 8140246 학교 코드
  // 97deea74959e4608a2c9d7255beb71c0 API 키

  // final date = DateTime(2023, 11, 15);
  final date = DateFormat("yyyyMMdd").format(DateTime.now());
  Map diet = await httpGet(
      "https://open.neis.go.kr/hub/mealServiceDietInfo?KEY=$apiKey&Type=json&ATPT_OFCDC_SC_CODE=N10&SD_SCHUL_CODE=8140246&MLSV_YMD=$date"); // 날짜 수정 필요

  List<String> dietData;
  try {
    dietData =
        diet["mealServiceDietInfo"][1]["row"][0]["DDISH_NM"].split("<br/>");

    return {
      "diet": dietData.map((e) => e.split(' ')[0]).toList(),
      "allergy": dietData.map((e) {
        final a = e.split(' ')[1];

        // return a.isNotEmpty ? a.substring(1, a.length - 1).split('.') : ["-1"];
        return a.isNotEmpty ? a.substring(1, a.length-1).split(".").map((e) => int.parse(e)).toList() : -1;
      }).toList()
    };
  } catch (err) {
    return {"diet": [], "allergy": []};
  }
}



class showLunch extends StatefulWidget {
  const showLunch({super.key});

  @override
  State<showLunch> createState() => _showLunchState();
}

class _showLunchState extends State<showLunch> {
  @override
  Widget build(BuildContext context) {
    //List<String> algList = ['','난류','우유','메밀','땅콩','대두', '밀', '고등어', '게', '새우', '돼지고기', '복숭아', '토마토','아황산류','호두', '닭고기', '쇠고기', '오징어', '조개류(굴,전복,홍합 포함)','잣'];
    return FutureBuilder(future: getDiet("97deea74959e4608a2c9d7255beb71c0"),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData == false) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(fontSize: 15),
                ),
              );
            } else {
              Map<String, List> txt = snapshot.data;
              return Text(
                txt.toString()
              );
            }
          },
);
  }
}