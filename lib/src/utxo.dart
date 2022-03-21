import 'status.dart';
import 'utils.dart';

class Utxo {
  late String txid;
  late int vout;
  late int value;
  late Status status;

  Utxo(this.txid, this.vout, this.value, this.status) {
    isEqual(txid.length, 64);
    isPositive(vout);
    isPositive(value);
    isPositive(vout);
  }

  Utxo.fromJson(Map<String, dynamic> json) {
    txid = json['txid'];
    vout = json['vout'];
    value = json['value'];
    status = Status.fromJson(json['status']);
    isEqual(txid.length, 64);
    isPositive(vout);
    isPositive(value);
    isPositive(vout);
  }

  Map<String, dynamic> toJson() =>
      {'txid': txid, 'vout': vout, 'value': value, 'status': status.toJson()};
}
