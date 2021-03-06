import 'package:esplora/src/stats.dart';
import 'package:test/test.dart';

const validJson = {
  "funded_txo_count": 2,
  "funded_txo_sum": 1136724,
  "spent_txo_count": 0,
  "spent_txo_sum": 0,
  "tx_count": 2,
};

void main() {
  test('Stats constructor', () {
    var stats = Stats(2, 1136724, 0, 0, 2);
    expect(stats.fundedTxoCount, 2);
    expect(stats.fundedTxoSum, 1136724);
    expect(stats.spentTxoCount, 0);
    expect(stats.spentTxoSum, 0);
    expect(stats.txCount, 2);
  });

  test('Stats.fromJson', () {
    var stats = Stats.fromJson(validJson);
    expect(stats.fundedTxoCount, 2);
    expect(stats.fundedTxoSum, 1136724);
    expect(stats.spentTxoCount, 0);
    expect(stats.spentTxoSum, 0);
    expect(stats.txCount, 2);
  });

  test('Stats.toJson', () {
    var stats = Stats.fromJson(validJson);
    expect(stats.toJson(), validJson);
  });

  test('Stats invalid values throws', () {
    var invalidJson = {
      "funded_txo_count": -1,
      "funded_txo_sum": -1,
      "spent_txo_count": -1,
      "spent_txo_sum": -1,
      "tx_count": -1,
    };
    expect(() => Stats.fromJson(invalidJson), throwsException);
  });
}
