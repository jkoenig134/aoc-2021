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
