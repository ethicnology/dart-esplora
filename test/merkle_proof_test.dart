import 'package:esplora/src/merkle_proof.dart';
import 'package:test/test.dart';

const validJson = {
  "block_height": 728418,
  "merkle": [
    "f575d61045518b80915d5b32094d6b1ba9c4a27ddc06dc95dce46118a9d2f7de",
    "5489ead1aaa1247c97fda9a8e49b1500c813cb1bf85b6d9d4974cb11175ad3c6",
    "794ff3de1100b3350de6b71837bfc05f816ea953bc64e8519b5e28de57519c6f",
    "869802e6da8d339d13bc1614872d88a425f840b71e8e00ee69b043b346cfbfca",
    "a925eadf5e2924bfd6595040177225f55a9ff7d55de0c611d75f7389b1f3881c",
    "b9113c42219371318e2894f9098e0555d8c9def11dd3642cf863f739869dad86",
    "f3b8fa5e6f7905c5ec667986c0c8e73234d369213c6fe26df7e97c58c55a36a4",
    "bf806478a0f7b86c34e43895d3f5ec83107b3402337c1fe7a1c75d55c5778457",
    "e2bb24963dd53474987c26778850a33b57915a8ad44a5b49bcca24dc38c710ae",
    "1cc7fb8e056d203e035d3c9da871b022a46c7b89ac1beac55e7e84198771d2b2",
    "fe5d946cac676e6c1c4590d0fd189f3aa089ee47a825ff3cead858bb74ec7bf7"
  ],
  "pos": 919
};

void main() {
  test('MerkleProof constructor', () {
    var proof = MerkleProof(
        728418,
        [
          "f575d61045518b80915d5b32094d6b1ba9c4a27ddc06dc95dce46118a9d2f7de",
          "5489ead1aaa1247c97fda9a8e49b1500c813cb1bf85b6d9d4974cb11175ad3c6",
          "794ff3de1100b3350de6b71837bfc05f816ea953bc64e8519b5e28de57519c6f",
          "869802e6da8d339d13bc1614872d88a425f840b71e8e00ee69b043b346cfbfca",
          "a925eadf5e2924bfd6595040177225f55a9ff7d55de0c611d75f7389b1f3881c",
          "b9113c42219371318e2894f9098e0555d8c9def11dd3642cf863f739869dad86",
          "f3b8fa5e6f7905c5ec667986c0c8e73234d369213c6fe26df7e97c58c55a36a4",
          "bf806478a0f7b86c34e43895d3f5ec83107b3402337c1fe7a1c75d55c5778457",
          "e2bb24963dd53474987c26778850a33b57915a8ad44a5b49bcca24dc38c710ae",
          "1cc7fb8e056d203e035d3c9da871b022a46c7b89ac1beac55e7e84198771d2b2",
          "fe5d946cac676e6c1c4590d0fd189f3aa089ee47a825ff3cead858bb74ec7bf7"
        ],
        919);
    expect(proof.blockHeight, 728418);
    expect(proof.pos, 919);
    expect(proof.merkle, [
      "f575d61045518b80915d5b32094d6b1ba9c4a27ddc06dc95dce46118a9d2f7de",
      "5489ead1aaa1247c97fda9a8e49b1500c813cb1bf85b6d9d4974cb11175ad3c6",
      "794ff3de1100b3350de6b71837bfc05f816ea953bc64e8519b5e28de57519c6f",
      "869802e6da8d339d13bc1614872d88a425f840b71e8e00ee69b043b346cfbfca",
      "a925eadf5e2924bfd6595040177225f55a9ff7d55de0c611d75f7389b1f3881c",
      "b9113c42219371318e2894f9098e0555d8c9def11dd3642cf863f739869dad86",
      "f3b8fa5e6f7905c5ec667986c0c8e73234d369213c6fe26df7e97c58c55a36a4",
      "bf806478a0f7b86c34e43895d3f5ec83107b3402337c1fe7a1c75d55c5778457",
      "e2bb24963dd53474987c26778850a33b57915a8ad44a5b49bcca24dc38c710ae",
      "1cc7fb8e056d203e035d3c9da871b022a46c7b89ac1beac55e7e84198771d2b2",
      "fe5d946cac676e6c1c4590d0fd189f3aa089ee47a825ff3cead858bb74ec7bf7"
    ]);
  });

  test('MerkleProof.fromJson', () {
    var proof = MerkleProof.fromJson(validJson);
    expect(proof.blockHeight, 728418);
    expect(proof.pos, 919);
    expect(proof.merkle, [
      "f575d61045518b80915d5b32094d6b1ba9c4a27ddc06dc95dce46118a9d2f7de",
      "5489ead1aaa1247c97fda9a8e49b1500c813cb1bf85b6d9d4974cb11175ad3c6",
      "794ff3de1100b3350de6b71837bfc05f816ea953bc64e8519b5e28de57519c6f",
      "869802e6da8d339d13bc1614872d88a425f840b71e8e00ee69b043b346cfbfca",
      "a925eadf5e2924bfd6595040177225f55a9ff7d55de0c611d75f7389b1f3881c",
      "b9113c42219371318e2894f9098e0555d8c9def11dd3642cf863f739869dad86",
      "f3b8fa5e6f7905c5ec667986c0c8e73234d369213c6fe26df7e97c58c55a36a4",
      "bf806478a0f7b86c34e43895d3f5ec83107b3402337c1fe7a1c75d55c5778457",
      "e2bb24963dd53474987c26778850a33b57915a8ad44a5b49bcca24dc38c710ae",
      "1cc7fb8e056d203e035d3c9da871b022a46c7b89ac1beac55e7e84198771d2b2",
      "fe5d946cac676e6c1c4590d0fd189f3aa089ee47a825ff3cead858bb74ec7bf7"
    ]);
  });

  test('MerkleProof.toJson', () {
    var merkle = MerkleProof.fromJson(validJson);
    expect(merkle.toJson(), validJson);
  });

  test('MerkleProof should throws', () {
    var invalidJson = {
      "block_height": -1,
      "merkle": [
        "invalid",
      ],
      "pos": -1
    };
    expect(() => MerkleProof.fromJson(invalidJson), throwsException);
  });
}
