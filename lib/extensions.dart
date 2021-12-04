extension Windowed<T> on List<T> {
  List<List<T>> windowed(int size) =>
      [for (var i = 0; i <= this.length - size; i++) this.sublist(i, i + size)];
}

extension Sum on List<int> {
  int get sum => this.fold(0, (a, b) => a + b);
}

extension BinaryToDecimal on String {
  int get binaryToDecimal => int.parse(this, radix: 2);
}

extension FlipListOfLists<T> on List<List<T>> {
  List<List<T>> flipped() {
    List<List<T>> flipped = [];

    for (var i = 0; i < this[1].length; i++) {
      final row = <T>[];

      for (var j = 0; j < this.length; j++) {
        row.add(this[j][i]);
      }

      flipped.add(row);
    }

    return flipped;
  }
}
