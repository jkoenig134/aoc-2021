import 'dart:math';

import './lib/extensions.dart';
import './lib/input_reader.dart';

main(List<String> args) {
  final testInput = InputReader.test(7, ",").asInt();
  print("""Test
  (1) ${part1(testInput)}
  (2) ${part2(testInput)}
  """);

  final input = InputReader(7, ",").asInt();
  print("""Real
  (1) ${part1(input)}
  (2) ${part2(input)}
  """);
}

int calculateMinimalCost(List<int> input, int Function(int) costFunction) {
  Map<int, int> costForSteps = {};

  final results = Set<int>.from(input).map(
    (n) => input
        .map((e) => (n - e).abs())
        .map((e) => costForSteps.putIfAbsent(e, () => costFunction(e)))
        .sum,
  );

  return results.reduce(min);
}

int part1(List<int> input) => calculateMinimalCost(input, (e) => e);

int part2(List<int> input) =>
    calculateMinimalCost(input, (e) => [for (int i = 1; i <= e; i++) i].sum);
