import 'package:esplora/src/utils.dart';
import 'package:test/test.dart';

void main() {
  test('isNonnegativeInt should throws', () {
    expect(() => isNonnegativeInt(-1), throwsException);
  });

  test('isNonnegativeNum should throws', () {
    expect(() => isNonnegativeNum(-1.1), throwsException);
  });

  test('isEqual should throws', () {
    expect(() => isEqual(10, 42), throwsException);
  });
}
