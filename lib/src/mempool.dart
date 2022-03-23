import 'utils.dart';

class Mempool {
  late int count;
  late int vsize;
  late int totalFee;
  late List<List<num>> feeHistogram;

  Mempool(this.count, this.vsize, this.totalFee, this.feeHistogram) {
    isNonnegativeInt(count);
    isNonnegativeInt(vsize);
    isNonnegativeInt(totalFee);
    for (List<num> tuple in feeHistogram) {
      isNonnegativeNum(tuple[0]);
      isNonnegativeNum(tuple[1]);
    }
  }

  Mempool.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    vsize = json['vsize'];
    totalFee = json['total_fee'];
    feeHistogram = json['fee_histogram'];
    isNonnegativeInt(count);
    isNonnegativeInt(vsize);
    isNonnegativeInt(totalFee);
    for (List<num> tuple in feeHistogram) {
      isNonnegativeNum(tuple[0]);
      isNonnegativeNum(tuple[1]);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'vsize': vsize,
      'total_fee': totalFee,
      'fee_histogram': feeHistogram,
    };
  }
}
