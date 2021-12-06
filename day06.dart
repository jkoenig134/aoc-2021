import './lib/extensions.dart';
import './lib/input_reader.dart';

class FishesOfAge {
  final fishes = {0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0};

  FishesOfAge(String input) {
    input
        .split(",")
        .map(int.parse)
        .forEach((age) => fishes[age] = fishes[age]! + 1);
  }

  void age() {
    final zeros = fishes[0]!;

    for (var i = 0; i < 8; i++) {
      fishes[i] = fishes[i + 1]!;
    }

    fishes[6] = fishes[6]! + zeros;
    fishes[8] = zeros;
  }

  FishesOfAge ageForDays(int days) {
    for (var i = 0; i < days; i++) age();
    return this;
  }

  int get total => fishes.values.toList().sum;
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

int part1(String input) => FishesOfAge(input).ageForDays(80).total;
int part2(String input) => FishesOfAge(input).ageForDays(256).total;
