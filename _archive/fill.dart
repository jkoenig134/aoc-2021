import 'dart:io';

import 'package:http/http.dart' as http;

void main() async {
  final day = DateTime.now().day;

  final cookie = File("_archive/cookie.secret").readAsStringSync();
  final response = await http.get(
    Uri.parse('https://adventofcode.com/2021/day/$day/input'),
    headers: {"cookie": cookie},
  );
  String data = response.body;
  data = data.substring(0, data.length - 1);

  File("input/$day.txt").writeAsStringSync(data);
}
