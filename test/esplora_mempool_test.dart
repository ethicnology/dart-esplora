import 'package:esplora/esplora.dart';
import 'package:test/test.dart';

/// These tests relies on mainnet transactions that can be spent in the future.
final url = Uri.parse("https://blockstream.info/");

Map<String, dynamic> json = {
  "count": 8017,
  "vsize": 3844746,
  "total_fee": 21382463,
  "fee_histogram": [
    [27.351206, 50056],
    [13.723404, 50054],
    [11.032836, 50242],
    [10.060606, 50366],
  ]
};

/// Mempool is dynamic, check esplora answer still match the class
void main() {
  test('getMempool', () async {
    var esplora = Esplora(url);
    Mempool mempool = await esplora.getMempool();
    expect(mempool.feeHistogram.isNotEmpty, true);
  });

  test('getMempoolTxids', () async {
    var esplora = Esplora(url);
    List<String> mempool = await esplora.getMempoolTxids();
    expect(mempool.isNotEmpty, true);
  });

  test('getMempoolRecent', () async {
    var esplora = Esplora(url);
    List<MempoolRecent> mempool = await esplora.getMempoolRecent();
    expect(mempool.isNotEmpty, true);
  });
}
