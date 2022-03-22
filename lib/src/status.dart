import 'utils.dart';

class Status {
  late bool confirmed;
  late int? blockHeight;
  late String? blockHash;
  late int? blockTime;

  Status(this.confirmed, this.blockHeight, this.blockHash, this.blockTime) {
    if (confirmed == false) {
      blockHeight = null;
      blockHash = null;
      blockTime = null;
    }
  }

  Status.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    if (confirmed == false) {
      blockHeight = null;
      blockHash = null;
      blockTime = null;
    } else {
      blockHeight = json['block_height'];
      blockHash = json['block_hash'];
      blockTime = json['block_time'];
      isPositive(blockHeight!);
      isEqual(blockHash!.length, 64);
      isPositive(blockTime!);
    }
  }

  Map<String, dynamic> toJson() => {
        'confirmed': confirmed,
        'block_height': blockHeight,
        'block_hash': blockHash,
        'block_time': blockTime,
      };
}
