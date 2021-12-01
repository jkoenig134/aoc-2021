import './lib/input_reader.dart';

main(List<String> args) {
  var testInput = InputReader.test(1).asString();
  print("""Test
  (1) $testInput
  (2) 
  """);

  var input = InputReader(1).asString();
  print("""Real
  (1) $input
  (2) 
  """);
}
