import 'utils.dart';

class Vout {
  late String scriptpubkey;
  late String scriptpubkeyAsm;
  late String scriptpubkeyType;
  late String scriptpubkeyAddress;
  late int value;

  Vout(this.scriptpubkey, this.scriptpubkeyAsm, this.scriptpubkeyType,
      this.scriptpubkeyAddress, this.value) {
    isPositive(value);
  }

  Vout.fromJson(Map<String, dynamic> json) {
    scriptpubkey = json['scriptpubkey'];
    scriptpubkeyAsm = json['scriptpubkey_asm'];
    scriptpubkeyType = json['scriptpubkey_type'];
    scriptpubkeyAddress = json['scriptpubkey_address'];
    value = json['value'];
    isPositive(value);
  }

  Map<String, dynamic> toJson() => {
        'scriptpubkey': scriptpubkey,
        'scriptpubkey_asm': scriptpubkeyAsm,
        'scriptpubkey_type': scriptpubkeyType,
        'scriptpubkey_address': scriptpubkeyAddress,
        'value': value,
      };
}
