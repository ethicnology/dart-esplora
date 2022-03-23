import 'status.dart';
import 'utils.dart';

class Utxo {
  late String txid;
  late int vout;
  late int value;
  late Status status;

  Utxo(this.txid, this.vout, this.value, this.status) {
    isEqual(txid.length, 64);
    isNonnegativeInt(vout);
    isNonnegativeInt(value);
    isNonnegativeInt(vout);
  }

  Utxo.fromJson(Map<String, dynamic> json) {
    txid = json['txid'];
    vout = json['vout'];
    value = json['value'];
    status = Status.fromJson(json['status']);
    isEqual(txid.length, 64);
    isNonnegativeInt(vout);
    isNonnegativeInt(value);
    isNonnegativeInt(vout);
  }

  Map<String, dynamic> toJson() =>
      {'txid': txid, 'vout': vout, 'value': value, 'status': status.toJson()};
}
