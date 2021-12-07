import 'dart:io';

import 'package:http/http.dart' as http;

void main() async {
  final day = DateTime.now().day;
  final dayAsString = day.toString().padLeft(2, "0");
  await Process.run("code", ["day$dayAsString.dart"]);
  await Process.run("code", ["input/$day.test.txt"]);
  await Process.run("code", ["input/$day.txt"]);

  final cookie = File("_archive/cookie.secret").readAsStringSync();
  final response = await http.get(
    Uri.parse('https://adventofcode.com/2021/day/$day/input'),
    headers: {"cookie": cookie},
  );
  String data = response.body;
  data = data.substring(0, data.length - 1);

  File("input/$day.txt").writeAsStringSync(data);
}
