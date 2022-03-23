import 'package:esplora/src/block_status.dart';
import 'package:test/test.dart';

const validJson = {
  "in_best_chain": true,
  "height": 0,
  "next_best":
      "00000000839a8e6886ab5951d76f411475428afc90947ee320161bbf18eb6048"
};

void main() {
  test('BlockStatus constructor', () {
    var blockStatus = BlockStatus(false, null, null);
    expect(blockStatus.inBestChain, false);
    expect(blockStatus.height, null);
    expect(blockStatus.nextBest, null);
  });

  test('BlockStatus.fromJson', () {
    var blockStatus = BlockStatus.fromJson(validJson);
    expect(blockStatus.inBestChain, true);
    expect(blockStatus.height, 0);
    expect(blockStatus.nextBest,
        "00000000839a8e6886ab5951d76f411475428afc90947ee320161bbf18eb6048");
  });

  test('BlockStatus.toJson', () {
    var merkle = BlockStatus.fromJson(validJson);
    expect(merkle.toJson(), validJson);
  });

  test('BlockStatus should throws', () {
    var invalidJson = {
      "in_best_chain": true,
      "height": -1,
      "next_best": "invalid"
    };
    expect(() => BlockStatus.fromJson(invalidJson), throwsException);
  });
}
