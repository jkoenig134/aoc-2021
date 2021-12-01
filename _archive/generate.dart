import 'dart:io';

void main(List<String> args) {
  for (var i = 2; i <= 25; i++) {
    final input = File("input/$i.txt");
    if (!input.existsSync()) input.writeAsString("");

    final testInput = File("input/$i.test.txt");
    if (!testInput.existsSync()) testInput.writeAsString("");
  }
}
