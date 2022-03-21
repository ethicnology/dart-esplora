import 'package:esplora/esplora.dart';
import 'package:test/test.dart';

/// These tests relies on testnet transactions that can be erased/altered in the future.
const url = "https://blockstream.info/testnet/";

void main() {
  group('getAddress', () {
    test('getAddress works', () async {
      Map<String, dynamic> json = {
        "chain_stats": {
          "funded_txo_count": 2,
          "funded_txo_sum": 1136724,
          "spent_txo_count": 0,
          "spent_txo_sum": 0,
          "tx_count": 2
        },
        "mempool_stats": {
          "funded_txo_count": 0,
          "funded_txo_sum": 0,
          "spent_txo_count": 0,
          "spent_txo_sum": 0,
          "tx_count": 0
        },
      };
      var esplora = Esplora(Uri.parse(url));
      Map<String, Stats> stats = await esplora
          .getAddress("tb1q94hkle7ghjv8h9fygasez5mrmlvarf4vhfjzlq");
      expect(stats['chain']!.fundedTxoCount,
          Stats.fromJson(json['chain_stats']).fundedTxoCount);
      expect(stats['chain']!.fundedTxoSum,
          Stats.fromJson(json['chain_stats']).fundedTxoSum);
      expect(stats['chain']!.spentTxoCount,
          Stats.fromJson(json['chain_stats']).spentTxoCount);
      expect(stats['chain']!.spentTxoSum,
          Stats.fromJson(json['chain_stats']).spentTxoSum);
      expect(
          stats['chain']!.txCount, Stats.fromJson(json['chain_stats']).txCount);
      expect(stats['mempool']!.fundedTxoCount,
          Stats.fromJson(json['mempool_stats']).fundedTxoCount);
      expect(stats['mempool']!.fundedTxoSum,
          Stats.fromJson(json['mempool_stats']).fundedTxoSum);
      expect(stats['mempool']!.spentTxoCount,
          Stats.fromJson(json['mempool_stats']).spentTxoCount);
      expect(stats['mempool']!.spentTxoSum,
          Stats.fromJson(json['mempool_stats']).spentTxoSum);
      expect(stats['mempool']!.txCount,
          Stats.fromJson(json['mempool_stats']).txCount);
    });
  });
}
