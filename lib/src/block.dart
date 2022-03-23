import 'utils.dart';

class Block {
  late String id;
  late int height;
  late int version;
  late int timestamp;
  late int txCount;
  late int size;
  late int weight;
  late String merkleRoot;
  late String? previousblockhash;
  late int mediantime;
  late int nonce;
  late int bits;
  late int difficulty;

  Block(
      this.id,
      this.height,
      this.version,
      this.timestamp,
      this.txCount,
      this.size,
      this.weight,
      this.merkleRoot,
      this.previousblockhash,
      this.mediantime,
      this.nonce,
      this.bits,
      this.difficulty) {
    isEqual(id.length, 64);
    isNonnegativeInt(height);
    isNonnegativeInt(version);
    isNonnegativeInt(timestamp);
    isNonnegativeInt(txCount);
    isNonnegativeInt(size);
    isNonnegativeInt(weight);
    isEqual(merkleRoot.length, 64);
    previousblockhash != null ? isEqual(previousblockhash!.length, 64) : {};
    isNonnegativeInt(mediantime);
    isNonnegativeInt(nonce);
    isNonnegativeInt(bits);
    isNonnegativeInt(difficulty);
  }

  Block.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    height = json['height'];
    version = json['version'];
    timestamp = json['timestamp'];
    txCount = json['tx_count'];
    size = json['size'];
    weight = json['weight'];
    merkleRoot = json['merkle_root'];
    previousblockhash = json['previousblockhash'];
    mediantime = json['mediantime'];
    nonce = json['nonce'];
    bits = json['bits'];
    difficulty = json['difficulty'];
    isEqual(id.length, 64);
    isNonnegativeInt(height);
    isNonnegativeInt(version);
    isNonnegativeInt(timestamp);
    isNonnegativeInt(txCount);
    isNonnegativeInt(size);
    isNonnegativeInt(weight);
    isEqual(merkleRoot.length, 64);
    previousblockhash != null ? isEqual(previousblockhash!.length, 64) : {};
    isNonnegativeInt(mediantime);
    isNonnegativeInt(nonce);
    isNonnegativeInt(bits);
    isNonnegativeInt(difficulty);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'height': height,
      'version': version,
      'timestamp': timestamp,
      'tx_count': txCount,
      'size': size,
      'weight': weight,
      'merkle_root': merkleRoot,
      'previousblockhash': previousblockhash,
      'mediantime': mediantime,
      'nonce': nonce,
      'bits': bits,
      'difficulty': difficulty,
    };
  }
}
