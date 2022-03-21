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

  group('getAddressUtxo', () {
    test('getAddressUtxo works', () async {
      var esplora = Esplora(Uri.parse(url));
      List<Utxo> utxo = await esplora
          .getAddressUtxo("tb1q94hkle7ghjv8h9fygasez5mrmlvarf4vhfjzlq");
      List<Utxo> expected = [
        Utxo(
            "3937b79a3e3ea9f26bd284f696afc6e6cd426bc0182b213f88f9338d2bb2d96d",
            1,
            10000,
            Status(
                true,
                2190517,
                "00000000000000e11283a2828be52fb7e94264de722c98fd0d1221be7efd7429",
                1647732997)),
        Utxo(
            "d66bacacca849b17bae2daab37114bd5417480b5fc057d71127cdd032103cabc",
            1,
            1126724,
            Status(
                true,
                2190517,
                "00000000000000e11283a2828be52fb7e94264de722c98fd0d1221be7efd7429",
                1647732997))
      ];
      for (var i = 0; i < expected.length; i++) {
        expect(utxo[i].txid, expected[i].txid);
        expect(utxo[i].value, expected[i].value);
      }
    });

    test('getAddressUtxo throws', () async {
      var esplora = Esplora(Uri.parse(url));
      expect(
          () async => await esplora.getAddressUtxo("invalid"), throwsException);
    });
  });
}
