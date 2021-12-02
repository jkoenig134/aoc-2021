import './lib/input_reader.dart';

enum Direction { up, down, forward }

class Instruction {
  late Direction direction;
  late int steps;

  Instruction.fromString(String input) {
    final split = input.split(" ");

    switch (split[0]) {
      case "up":
        direction = Direction.up;
        break;
      case "down":
        direction = Direction.down;
        break;
      case "forward":
        direction = Direction.forward;
        break;
    }

    this.steps = int.parse(split[1]);
  }

  static List<Instruction> fromStringList(List<String> input) =>
      input.map((line) => Instruction.fromString(line)).toList();
}

class Submarine {
  var horizontal = 0;
  var depth = 0;
  var aim = 0;

  void move(Instruction instruction) {
    switch (instruction.direction) {
      case Direction.up:
        aim -= instruction.steps;
        break;
      case Direction.down:
        aim += instruction.steps;
        break;
      case Direction.forward:
        horizontal += instruction.steps;
        depth += aim * instruction.steps;
        break;
    }
  }

  void applyInstructions(List<Instruction> instructions) =>
      instructions.forEach((instruction) => move(instruction));

  int part1() => horizontal * aim;
  int part2() => horizontal * depth;
}

main(List<String> args) {
  var testInput = Instruction.fromStringList(InputReader.test(2).asString());
  var testShip = Submarine()..applyInstructions(testInput);
  print("""Test
  (1) ${testShip.part1()}
  (2) ${testShip.part2()}
  """);

  var input = Instruction.fromStringList(InputReader(2).asString());
  var ship = Submarine()..applyInstructions(input);
  print("""Real
  (1) ${ship.part1()}
  (2) ${ship.part2()}
  """);
}
