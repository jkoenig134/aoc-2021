import 'dart:io';

class InputReader {
  final String _input;
  InputReader(int day) : _input = File('./input/$day.txt').readAsStringSync();
  InputReader.test(int day)
      : _input = File('./input/$day.test.txt').readAsStringSync();

  List<String> asString() => _input.split("\n");
  List<String> asNewlineString() =>
      _input.split("\n\n").map((e) => e.replaceAll("\n", " ")).toList();
  List<int> asInt() => asString().map(int.parse).toList();
  List<List<String>> asStringList() =>
      _input.split("\n").map((e) => e.split("")).toList();
}
