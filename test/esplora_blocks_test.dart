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
  test('getTx', () async {
    var esplora = Esplora(url);
    Block tx = await esplora.getBlock(hash);
    expect(tx.toJson(), json);
  });
}
