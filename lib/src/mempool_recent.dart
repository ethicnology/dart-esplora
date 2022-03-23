import 'utils.dart';

class MempoolRecent {
  late String txid;
  late int fee;
  late int vsize;
  late int value;

  MempoolRecent(this.txid, this.fee, this.vsize, this.value) {
    isEqual(txid.length, 64);
    isNonnegativeInt(fee);
    isNonnegativeInt(vsize);
    isNonnegativeInt(value);
  }

  MempoolRecent.fromJson(Map<String, dynamic> json) {
    txid = json['txid'];
    fee = json['fee'];
    vsize = json['vsize'];
    value = json['value'];
    isEqual(txid.length, 64);
    isNonnegativeInt(fee);
    isNonnegativeInt(vsize);
    isNonnegativeInt(value);
  }

  Map<String, dynamic> toJson() {
    return {
      'txid': txid,
      'fee': fee,
      'vsize': vsize,
      'value': value,
    };
  }
}
