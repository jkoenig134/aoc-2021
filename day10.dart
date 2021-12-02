import './lib/input_reader.dart';

main(List<String> args) {
  var testInput = InputReader.test(10).asInt();
  print("""Test
  (1) ${part1(testInput)}
  (2) ${part2(testInput)}
  """);

  var input = InputReader(10).asInt();
  print("""Real
  (1) ${part1(input)}
  (2) ${part2(input)}
  """);
}

int part1(List<int> input) {
  return 0;
}

int part2(List<int> input) {
  return 0;
}
