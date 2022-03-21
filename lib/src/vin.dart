import 'utils.dart';
import 'vout.dart';

class Vin {
  late String txid;
  late int vout;
  late Vout prevout;
  late String scriptsig;
  late String scriptsigAsm;
  late List<String> witness;
  late bool isCoinbase;
  late int sequence;

  Vin(this.txid, this.vout, this.prevout, this.scriptsig, this.scriptsigAsm,
      this.witness, this.isCoinbase, this.sequence) {
    isEqual(txid.length, 64);
    isPositive(vout);
    isPositive(sequence);
  }

  Vin.fromJson(Map<String, dynamic> json) {
    txid = json['txid'];
    vout = json['vout'];
    prevout = Vout.fromJson(json['prevout']);
    scriptsig = json['scriptsig'];
    scriptsigAsm = json['scriptsig_asm'];
    witness = json['witness'];
    isCoinbase = json['is_coinbase'];
    sequence = json['sequence'];
    isEqual(txid.length, 64);
    isPositive(vout);
    isPositive(sequence);
  }

  Map<String, dynamic> toJson() => {
        'txid': txid,
        'vout': vout,
        'prevout': prevout.toJson(),
        'scriptsig': scriptsig,
        'scriptsig_asm': scriptsigAsm,
        'witness': witness,
        'is_coinbase': isCoinbase,
        'sequence': sequence,
      };
}
