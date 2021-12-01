import './lib/input_reader.dart';

main(List<String> args) {
  var testInput = InputReader.test(1).asInt();
  print("""Test
  (1) ${part1(testInput)}
  (2) ${part2(testInput)}
  """);

  var input = InputReader(1).asInt();
  print("""Real
  (1) ${part1(input)}
  (2) ${part2(input)}
  """);
}

int part1(List<int> input) {
  var higher = 0;
  int current = input.first;

  input.skip(1).forEach((i) {
    if (i > current) higher++;
    current = i;
  });

  return higher;
}

int part2(List<int> input) {
  var higher = 0;

  var sum = (int i) => input[i] + input[(i + 1)] + input[(i + 2)];

  for (var i = 0; i < input.length - 3; i++) {
    int current = sum(i);
    int next = sum(i + 1);

    if (current < next) higher++;
  }

  return higher;
}
