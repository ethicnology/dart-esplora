import 'utils.dart';

class Mempool {
  /// the number of transactions in the mempool
  late int count;

  /// the total size of mempool transactions in virtual bytes
  late int vsize;

  /// the total fee paid by mempool transactions in satoshis
  late int totalFee;

  /// mempool fee-rate distribution histogram
  /// An array of (feerate, vsize) tuples, where each entry's vsize is the total vsize of transactions paying more than feerate but less than the previous entry's feerate (except for the first entry, which has no upper bound). This matches the format used by the Electrum RPC protocol for mempool.get_fee_histogram.
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
