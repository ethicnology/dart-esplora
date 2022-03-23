import 'utils.dart';

class BlockStatus {
  late bool inBestChain;
  late int? height;
  late String? nextBest;

  BlockStatus(this.inBestChain, this.height, this.nextBest) {
    if (inBestChain == true) {
      isNonnegativeInt(height!);
      isEqual(nextBest!.length, 64);
    } else {
      height = null;
      nextBest = null;
    }
  }

  BlockStatus.fromJson(Map<String, dynamic> json) {
    inBestChain = json['in_best_chain'];
    if (inBestChain == true) {
      height = json['height'];
      nextBest = json['next_best'];
      isNonnegativeInt(height!);
      isEqual(nextBest!.length, 64);
    } else {
      height = null;
      nextBest = null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'in_best_chain': inBestChain,
      'height': height,
      'next_best': nextBest,
    };
  }
}
