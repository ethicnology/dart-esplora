import 'status.dart';
import 'utils.dart';
import 'vin.dart';
import 'vout.dart';

class Transaction {
  late String txid;
  late int version;
  late int locktime;
  late List<Vin> vin;
  late List<Vout> vout;
  late int size;
  late int weight;
  late int fee;
  late Status status;

  Transaction(this.txid, this.version, this.locktime, this.vin, this.vout,
      this.size, this.weight, this.fee, this.status) {
    isEqual(txid.length, 64);
    isPositive(version);
    isPositive(locktime);
    isPositive(size);
    isPositive(weight);
    isPositive(fee);
  }

  Transaction.fromJson(Map<String, dynamic> json) {
    txid = json['txid'];
    version = json['version'];
    locktime = json['locktime'];
    vin = List.from(json['vin']).map((i) => Vin.fromJson(i)).toList();
    vout = List.from(json['vout']).map((i) => Vout.fromJson(i)).toList();
    size = json['size'];
    weight = json['weight'];
    fee = json['fee'];
    status = Status.fromJson(json['status']);
    isEqual(txid.length, 64);
    isPositive(version);
    isPositive(locktime);
    isPositive(size);
    isPositive(weight);
    isPositive(fee);
  }

  Map<String, dynamic> toJson() => {
        'txid': txid,
        'version': version,
        'locktime': locktime,
        'vin': vin.map((item) => item.toJson()).toList(),
        'vout': vout.map((item) => item.toJson()).toList(),
        'size': size,
        'weight': weight,
        'fee': fee,
        'status': status.toJson(),
      };
}
