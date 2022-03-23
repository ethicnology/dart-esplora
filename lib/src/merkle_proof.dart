import 'utils.dart';

class MerkleProof {
  late int blockHeight;
  late List<String> merkle;
  late int pos;

  MerkleProof(this.blockHeight, this.merkle, this.pos) {
    isNonnegativeInt(blockHeight);
    isNonnegativeInt(pos);
    for (var hash in merkle) {
      isEqual(hash.length, 64);
    }
  }

  MerkleProof.fromJson(Map<String, dynamic> json) {
    blockHeight = json['block_height'];
    merkle = List.from(json['merkle']);
    pos = json['pos'];
    isNonnegativeInt(blockHeight);
    isNonnegativeInt(pos);
    for (var hash in merkle) {
      isEqual(hash.length, 64);
    }
  }

  Map<String, dynamic> toJson() =>
      {'block_height': blockHeight, 'merkle': merkle, 'pos': pos};
}
