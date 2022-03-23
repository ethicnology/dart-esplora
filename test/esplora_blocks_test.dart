import 'package:esplora/esplora.dart';
import 'package:test/test.dart';

/// These tests relies on mainnet transactions that can be spent in the future.
final url = Uri.parse("https://blockstream.info/");
const hash = "000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f";

Map<String, dynamic> json = {
  "id": "000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f",
  "height": 0,
  "version": 1,
  "timestamp": 1231006505,
  "tx_count": 1,
  "size": 285,
  "weight": 816,
  "merkle_root":
      "4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b",
  "previousblockhash": null,
  "mediantime": 1231006505,
  "nonce": 2083236893,
  "bits": 486604799,
  "difficulty": 1
};

void main() {
  test('getBlock', () async {
    var esplora = Esplora(url);
    Block block = await esplora.getBlock(hash);
    expect(block.toJson(), json);
  });

  test('getBlockHeader', () async {
    var esplora = Esplora(url);
    String header = await esplora.getBlockHeader(hash);
    expect(header,
        "0100000000000000000000000000000000000000000000000000000000000000000000003ba3edfd7a7b12b27ac72c3e67768f617fc81bc3888a51323a9fb8aa4b1e5e4a29ab5f49ffff001d1dac2b7c");
  });

  test('getBlockStatus block in best chain', () async {
    var esplora = Esplora(url);
    BlockStatus blockStatus = await esplora.getBlockStatus(hash);
    expect(blockStatus.inBestChain, true);
    expect(blockStatus.height, 0);
    expect(blockStatus.nextBest,
        "00000000839a8e6886ab5951d76f411475428afc90947ee320161bbf18eb6048");
  });

  test('getBlockStatus stale/orphan block', () async {
    var esplora = Esplora(url);
    String staleBlock =
        "00000000000000000005e086e9e74aae37139ba27c5ba8b50ba5c773e22c6b61";
    BlockStatus blockStatus = await esplora.getBlockStatus(staleBlock);
    expect(blockStatus.inBestChain, false);
    expect(blockStatus.height, null);
    expect(blockStatus.nextBest, null);
  });

  test('getBlockTxs', () async {
    var esplora = Esplora(url);
    List<Transaction> blockTxs = await esplora.getBlockTxs(hash);
    expect(blockTxs.length, 1);
  });

  test('getBlockTxids', () async {
    var esplora = Esplora(url);
    List<String> blockTxids = await esplora.getBlockTxids(hash);
    expect(blockTxids.length, 1);
  });

  test('getBlockTxid', () async {
    var esplora = Esplora(url);
    String txid = await esplora.getBlockTxid(hash, 0);
    expect(txid,
        "4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b");
  });

  test('getBlockHeight', () async {
    var esplora = Esplora(url);
    String hash = await esplora.getBlockHeight(0);
    expect(hash, json['id']);
  });

  test('getBlocks', () async {
    var esplora = Esplora(url);
    List<Block> blocks = await esplora.getBlocks(height: 0);
    expect(blocks[0].toJson(), json);
  });

  test('getBlocksTipHeight', () async {
    var esplora = Esplora(url);
    int bestBlockHeight = await esplora.getBlocksTipHeight();
    expect(bestBlockHeight > 728655, true);
  });

  test('getBlocksTipHash', () async {
    var esplora = Esplora(url);
    String bestBlockHash = await esplora.getBlocksTipHash();
    expect(bestBlockHash.length, 64);
  });
}
