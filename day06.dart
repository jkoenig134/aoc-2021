import './lib/extensions.dart';
import './lib/input_reader.dart';

class Swarm {
  final fishes = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  int get numberOfFishes => fishes.sum;

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
}

main(List<String> args) {
  final testInput = InputReader.test(6).raw();
  final testSwarm = Swarm(testInput);
  print("""Test
  (1) ${testSwarm.ageForDays(80).numberOfFishes}
  (2) ${testSwarm.ageForDays(256 - 80).numberOfFishes}
  """);

  final input = InputReader(6).raw();
  final swarm = Swarm(input);
  print("""Real
  (1) ${swarm.ageForDays(80).numberOfFishes}
  (2) ${swarm.ageForDays(256 - 80).numberOfFishes}
  """);
}
