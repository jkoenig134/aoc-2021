import './lib/extensions.dart';
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

int part1(List<int> input) =>
    input.windowed(2).where((w) => w[1] > w[0]).length;

int part2(List<int> input) {
  final unnoised = input.windowed(3).map((w) => w.sum).toList();
  return part1(unnoised);
}
