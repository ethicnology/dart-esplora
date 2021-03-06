import 'package:esplora/esplora.dart';
import 'package:test/test.dart';

/// These tests relies on mainnet transactions that can be spent/altered in the future.
final url = Uri.parse("https://blockstream.info/");
const address = "1TAHuoo6tKwZCyPja1mkkYQxmNZBW9HYP";

void main() {
  test('getAddress', () async {
    Map<String, dynamic> json = {
      "chain_stats": {
        "funded_txo_count": 1,
        "funded_txo_sum": 1312,
        "spent_txo_count": 0,
        "spent_txo_sum": 0,
        "tx_count": 1
      },
      "mempool_stats": {
        "funded_txo_count": 0,
        "funded_txo_sum": 0,
        "spent_txo_count": 0,
        "spent_txo_sum": 0,
        "tx_count": 0
      },
    };
    var esplora = Esplora(url);
    Map<String, Stats> stats = await esplora.getAddress(address);
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

  group('getAddressUtxo', () {
    test('getAddressUtxo', () async {
      var esplora = Esplora(url);
      List<Utxo> utxo = await esplora.getAddressUtxo(address);
      Utxo expected = Utxo(
          "f2957c19e673406c6388b0e8f1c9f1e51e81cb56e83730415c1cd7b154666c1b",
          0,
          1312,
          Status(
              true,
              728418,
              "00000000000000000006aa48d85e9229454621c0addbd2bbda4e3d280eade466",
              1647902012));
      expect(utxo[utxo.length - 1].txid, expected.txid);
      expect(utxo[utxo.length - 1].vout, expected.vout);
      expect(utxo[utxo.length - 1].value, expected.value);
    });

    test('getAddressUtxo throws', () {
      var esplora = Esplora(url);
      expect(
          () async => await esplora.getAddressUtxo("invalid"), throwsException);
    });
  });

  test('getAddressTxs', () async {
    var esplora = Esplora(url);
    List<Transaction> result = await esplora.getAddressTxs(address);
    expect(result[result.length - 1].txid,
        "f2957c19e673406c6388b0e8f1c9f1e51e81cb56e83730415c1cd7b154666c1b");
    expect(result[result.length - 1].vin[0].txid,
        "dca87fe24dfe3f308014ed4b6a91ad39ae06c7ee279eb14b1b78645f90cef36d");
    expect(result[result.length - 1].vout[0].scriptpubkey,
        "76a91404f2923ad0c41b1f934492b77813c3a20f355ce188ac");
    expect(result[result.length - 1].status.blockHeight, 728418);
  });

  test('getAddressTxsChain', () async {
    var esplora = Esplora(url);
    List<Transaction> result =
        await esplora.getAddressTxsChain(address, lastSeenTxid: "");
    expect(result[result.length - 1].txid,
        "f2957c19e673406c6388b0e8f1c9f1e51e81cb56e83730415c1cd7b154666c1b");
    expect(result[result.length - 1].vin[0].txid,
        "dca87fe24dfe3f308014ed4b6a91ad39ae06c7ee279eb14b1b78645f90cef36d");
    expect(result[result.length - 1].vout[0].scriptpubkey,
        "76a91404f2923ad0c41b1f934492b77813c3a20f355ce188ac");
    expect(result[result.length - 1].status.blockHeight, 728418);
  });

  test('getAddressPrefix', () async {
    var esplora = Esplora(url);
    List<String> result = await esplora.getAddressPrefix("1111111111111111111");
    List<String> expected = [
      "1111111111111111111114oLvT2",
      "111111111111111111112czxoHN",
      "11111111111111111111BZbvjr",
      "1111111111111111111a49ZJYU"
    ];
    Map mapResult = {for (var address in result) address: address};
    for (var address in expected) {
      expect(mapResult.containsKey(address), true);
    }
  });

  /// Mempool is hard to test because transactions doesn't stay there.
  test('getAddressTxsMempool', () async {
    var esplora = Esplora(url);
    List<Transaction> result = await esplora.getAddressTxsMempool(address);
    expect(result, []);
  });
}
