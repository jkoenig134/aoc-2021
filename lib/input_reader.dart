import 'dart:io';

class InputReader {
  final String splitPattern;

  final String _input;
  InputReader(int day, [this.splitPattern = "\n"])
      : _input = File('./input/$day.txt').readAsStringSync();
  InputReader.test(int day, [this.splitPattern = "\n"])
      : _input = File('./input/$day.test.txt').readAsStringSync();

  String raw() => _input;

  List<String> asString() => _input.split(splitPattern);
  List<int> asInt() => asString().map(int.parse).toList();

  List<String> asNewlineString() =>
      _input.split("\n\n").map((e) => e.replaceAll("\n", " ")).toList();

  List<List<String>> asStringList() =>
      _input.split("\n").map((e) => e.split("")).toList();
}
