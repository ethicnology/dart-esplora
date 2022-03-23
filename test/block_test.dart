import 'package:esplora/src/block.dart';
import 'package:test/test.dart';

const validJson = {
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
  test('Block constructor', () {
    var block = Block(
        "000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f",
        0,
        1,
        1231006505,
        1,
        285,
        816,
        "4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b",
        null,
        1231006505,
        2083236893,
        486604799,
        1);
    expect(block.id,
        "000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f");
    expect(block.height, 0);
    expect(block.version, 1);
    expect(block.timestamp, 1231006505);
    expect(block.txCount, 1);
    expect(block.size, 285);
    expect(block.weight, 816);
    expect(block.merkleRoot,
        "4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b");
    expect(block.previousblockhash, null);
    expect(block.mediantime, 1231006505);
    expect(block.nonce, 2083236893);
    expect(block.bits, 486604799);
    expect(block.difficulty, 1);
  });

  test('Block.fromJson', () {
    var block = Block.fromJson(validJson);
    expect(block.id,
        "000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f");
    expect(block.height, 0);
    expect(block.version, 1);
    expect(block.timestamp, 1231006505);
    expect(block.txCount, 1);
    expect(block.size, 285);
    expect(block.weight, 816);
    expect(block.merkleRoot,
        "4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b");
    expect(block.previousblockhash, null);
    expect(block.mediantime, 1231006505);
    expect(block.nonce, 2083236893);
    expect(block.bits, 486604799);
    expect(block.difficulty, 1);
  });

  test('Block.toJson', () {
    var merkle = Block.fromJson(validJson);
    expect(merkle.toJson(), validJson);
  });

  test('Block should throws', () {
    var invalidJson = {
      "id": "invalid",
      "height": -1,
      "version": -1,
      "timestamp": -1,
      "tx_count": -1,
      "size": -1,
      "weight": -1,
      "merkle_root": "invalid",
      "previousblockhash": "invalid",
      "mediantime": -1,
      "nonce": -1,
      "bits": -1,
      "difficulty": -1
    };
    expect(() => Block.fromJson(invalidJson), throwsException);
  });
}
