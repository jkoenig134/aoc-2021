import './lib/extensions.dart';
import './lib/input_reader.dart';

class BingoField {
  final int value;
  var checked = false;

  BingoField(this.value);
}

class BingoBoard {
  late final List<List<BingoField>> rows;
  late final List<List<BingoField>> columns;

  BingoBoard.fromString(String input) {
    this.rows = input
        .split("\n")
        .map(
          (e) => e
              .replaceAll("  ", " ")
              .replaceFirst(RegExp("^ "), "")
              .split(" ")
              .map((e) => BingoField(int.parse(e)))
              .toList(),
        )
        .toList();

    columns = rows.flipped();
  }

  bool _isWinner() {
    for (var row in rows) {
      if (row.every((field) => field.checked)) {
        return true;
      }
    }

    for (var column in columns) {
      if (column.every((field) => field.checked)) {
        return true;
      }
    }

    return false;
  }

  bool submitNumber(int number) {
    for (var row in rows) {
      for (var field in row) {
        if (field.value == number) {
          field.checked = true;
        }
      }
    }

    for (var column in columns) {
      for (var field in column) {
        if (field.value == number) {
          field.checked = true;
        }
      }
    }

    return _isWinner();
  }

  int uncheckedSum() => rows
      .map((e) => e
          .where((element) => !element.checked)
          .map((e) => e.value)
          .toList()
          .sum)
      .toList()
      .sum;
}

main(List<String> args) {
  var testInput = InputReader.test(4).raw();
  print("""Test
  (1) ${part1(testInput)}
  (2) ${part2(testInput)}
  """);

  var input = InputReader(4).raw();
  print("""Real
  (1) ${part1(input)}
  (2) ${part2(input)}
  """);
}

int part1(String input) {
  final splitted = input.split("\n\n");

  final bingoInstructions = splitted[0].split(",").map(int.parse).toList();
  splitted.removeAt(0);

  final bingoBoards = splitted.map((e) => BingoBoard.fromString(e)).toList();

  for (var instruction in bingoInstructions) {
    for (var board in bingoBoards) {
      if (board.submitNumber(instruction)) {
        final uncheckedSum = board.uncheckedSum();
        return uncheckedSum * instruction;
      }
    }
  }

  return 0;
}

int part2(String input) {
  final splitted = input.split("\n\n");

  final bingoInstructions = splitted[0].split(",").map(int.parse).toList();
  splitted.removeAt(0);

  final bingoBoards = splitted.map((e) => BingoBoard.fromString(e)).toList();

  for (var instruction in bingoInstructions) {
    if (bingoBoards.length == 1) {
      final board = bingoBoards[0];
      if (board.submitNumber(instruction)) {
        return instruction * board.uncheckedSum();
      }
    }

    bingoBoards.removeWhere((e) => e.submitNumber(instruction));
  }

  return 0;
}
