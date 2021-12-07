import 'dart:io';

class InputReader {
  final String splitPattern;

  final String _input;
  InputReader(int day, [this.splitPattern = "\n"])
      : _input = File('./input/$day.txt').readAsStringSync();
  InputReader.test(int day, [this.splitPattern = "\n"])
      : _input = File('./input/$day.test.txt').readAsStringSync();

  String raw() => _input;

  List<String> asString() => _input.split(this.splitPattern);
  List<int> asInt() => asString().map(int.parse).toList();

  List<String> asNewlineString() =>
      _input.split("\n\n").map((e) => e.replaceAll("\n", " ")).toList();

  List<List<String>> asStringList() =>
      _input.split("\n").map((e) => e.split("")).toList();

  static List<List<String>> asFlippedStringList(List<List<String>> input) {
    List<List<String>> flipped = [];

    for (var i = 0; i < input[1].length; i++) {
      final row = <String>[];

      for (var j = 0; j < input.length; j++) {
        row.add(input[j][i]);
      }

      flipped.add(row);
    }

    return flipped;
  }
}
