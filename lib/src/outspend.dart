import 'status.dart';
import 'utils.dart';

class Outspend {
  late bool spent;
  late String? txid;
  late int? vin;
  late Status? status;

  Outspend(this.spent, this.txid, this.vin, this.status);

  Outspend.fromJson(Map<String, dynamic> json) {
    spent = json['spent'];
    if (spent == false) {
      txid = null;
      vin = null;
      status = null;
    } else {
      txid = json['txid'];
      vin = json['vin'];
      status = Status.fromJson(json['status']);
      isEqual(txid!.length, 64);
      isNonnegativeInt(vin!);
    }
  }

  Map<String, dynamic> toJson() {
    if (spent == true) {
      return {
        'spent': spent,
        'txid': txid,
        'vin': vin,
        'status': status!.toJson()
      };
    } else {
      return {'spent': spent};
    }
  }
}
