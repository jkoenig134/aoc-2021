import './lib/extensions.dart';
import './lib/input_reader.dart';

class Swarm {
  final fishes = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  Swarm(String input) {
    input
        .split(",")
        .map(int.parse)
        .forEach((age) => fishes[age] = fishes[age] + 1);
  }

  void age() {
    final zeroes = fishes.removeAt(0);
    fishes[6] = fishes[6] + zeroes;
    fishes.add(zeroes);
  }

  Swarm ageForDays(int days) {
    for (var i = 0; i < days; i++) age();
    return this;
  }

  int get total => fishes.sum;
}

main(List<String> args) {
  var testInput = InputReader.test(6).raw();
  print("""Test
  (1) ${part1(testInput)}
  (2) ${part2(testInput)}
  """);

  var input = InputReader(6).raw();
  print("""Real
  (1) ${part1(input)}
  (2) ${part2(input)}
  """);
}

int part1(String input) => Swarm(input).ageForDays(80).total;
int part2(String input) => Swarm(input).ageForDays(256).total;
