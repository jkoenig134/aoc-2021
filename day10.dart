import 'dart:collection';

import './lib/extensions.dart';
import './lib/input_reader.dart';

class ChunkProcessor {
  final List<String> input;

  int _corruptionLevel = 0;
  bool get isCorrupted => _corruptionLevel != 0;

  final _queue = Queue<String>();

  ChunkProcessor(this.input);

  int corrupted() {
    for (String character in input) {
      switch (character) {
        case '(':
        case "[":
        case "<":
        case "{":
          _queue.add(character);
          break;
        case ')':
          if (_queue.last != "(") return _corruptionLevel = 3;
          _queue.removeLast();
          break;
        case ']':
          if (_queue.last != "[") return _corruptionLevel = 57;
          _queue.removeLast();
          break;
        case '}':
          if (_queue.last != "{") return _corruptionLevel = 1197;
          _queue.removeLast();
          break;
        case '>':
          if (_queue.last != "<") return _corruptionLevel = 25137;
          _queue.removeLast();
          break;
      }
    }

    return 0;
  }

  int incomplete() {
    if (isCorrupted) throw "corrupted input can't be checked for incomplete";
    int score = 0;

    while (_queue.isNotEmpty) {
      final char = _queue.removeLast();
      score *= 5;

      switch (char) {
        case '(':
          score += 1;
          break;
        case "[":
          score += 2;
          break;
        case "{":
          score += 3;
          break;
        case "<":
          score += 4;
          break;
      }
    }

    return score;
  }
}

main(List<String> args) {
  final testInput = InputReader.test(10)
      .asStringList()
      .map((e) => ChunkProcessor(e))
      .toList();
  print("""Test
  (1) ${part1(testInput)}
  (2) ${part2(testInput)}
  """);

  final input = InputReader(10) //
      .asStringList()
      .map((e) => ChunkProcessor(e))
      .toList();
  print("""Real
  (1) ${part1(input)}
  (2) ${part2(input)}
  """);
}

int part1(List<ChunkProcessor> input) => input.map((e) => e.corrupted()).sum;

int part2(List<ChunkProcessor> input) {
  final scores = input
      .where((e) => !e.isCorrupted)
      .map((e) => e.incomplete())
      .toList()
    ..sort();

  return scores[scores.length ~/ 2];
}
