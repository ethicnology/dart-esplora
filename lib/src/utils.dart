void isNonnegativeInt(int value) {
  if (value < 0) {
    throw Exception("$value is not > 0");
  }
}

void isNonnegativeNum(num value) {
  if (value < 0.0) {
    throw Exception("$value is not > 0.0");
  }
}

void isEqual(int value, int expected) {
  if (value != expected) {
    throw Exception("$value and $expected are not equal");
  }
}
