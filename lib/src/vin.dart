import 'utils.dart';
import 'vout.dart';

class Vin {
  late String txid;
  late int vout;

  /// Some old bitcoin txs doesn't have a prevout: 4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b
  late Vout? prevout;
  late String scriptsig;
  late String scriptsigAsm;

  /// Some old bitcoin txs doesn't have a witness: 4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b
  late List<String>? witness;
  late bool isCoinbase;
  late int sequence;
  String innerRedeemscriptAsm = "";
  String innerWitnessscriptAsm = "";

  Vin(
      this.txid,
      this.vout,
      this.prevout,
      this.scriptsig,
      this.scriptsigAsm,
      this.witness,
      this.isCoinbase,
      this.sequence,
      this.innerRedeemscriptAsm,
      this.innerWitnessscriptAsm) {
    isEqual(txid.length, 64);
    isNonnegativeInt(vout);
    isNonnegativeInt(sequence);
  }

  Vin.fromJson(Map<String, dynamic> json) {
    txid = json['txid'];
    vout = json['vout'];
    json['prevout'] == null
        ? prevout = null
        : prevout = Vout.fromJson(json['prevout']);
    scriptsig = json['scriptsig'];
    scriptsigAsm = json['scriptsig_asm'];
    json['witness'] == null
        ? witness = []
        : witness = List.from(json['witness']);
    isCoinbase = json['is_coinbase'];
    sequence = json['sequence'];
    json['inner_redeemscript_asm'] != null
        ? innerRedeemscriptAsm = json['inner_redeemscript_asm']
        : {};
    json['inner_witnessscript_asm'] != null
        ? innerWitnessscriptAsm = json['inner_witnessscript_asm']
        : {};
    isEqual(txid.length, 64);
    isNonnegativeInt(vout);
    isNonnegativeInt(sequence);
  }

  Map<String, dynamic> toJson() => {
        'txid': txid,
        'vout': vout,
        'prevout': prevout?.toJson(),
        'scriptsig': scriptsig,
        'scriptsig_asm': scriptsigAsm,
        'witness': witness,
        'is_coinbase': isCoinbase,
        'sequence': sequence,
        'inner_redeemscript_asm': innerRedeemscriptAsm,
        'inner_witnessscript_asm': innerWitnessscriptAsm,
      };
}
