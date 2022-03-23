import 'package:esplora/src/mempool.dart';
import 'package:test/test.dart';

const validJson = {
  "count": 8017,
  "vsize": 3844746,
  "total_fee": 21382463,
  "fee_histogram": [
    [27.351206, 50056],
    [13.723404, 50054],
    [11.032836, 50242],
  ]
};

void main() {
  test('Mempool constructor', () {
    var mempool = Mempool(8017, 3844746, 21382463, []);
    expect(mempool.count, 8017);
    expect(mempool.vsize, 3844746);
    expect(mempool.totalFee, 21382463);
    expect(mempool.feeHistogram, []);
  });

  test('Mempool.fromJson', () {
    var mempool = Mempool.fromJson(validJson);
    expect(mempool.count, 8017);
    expect(mempool.vsize, 3844746);
    expect(mempool.totalFee, 21382463);
    expect(mempool.feeHistogram, [
      [27.351206, 50056],
      [13.723404, 50054],
      [11.032836, 50242],
    ]);
  });

  test('Mempool.toJson', () {
    var merkle = Mempool.fromJson(validJson);
    expect(merkle.toJson(), validJson);
  });

  test('Mempool should throws', () {
    var invalidJson = {
      "count": -1,
      "vsize": -1,
      "total_fee": -1,
      "fee_histogram": [
        [-1, -1.1]
      ]
    };
    expect(() => Mempool.fromJson(invalidJson), throwsException);
  });
}
