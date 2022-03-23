import 'package:esplora/src/vout.dart';
import 'package:test/test.dart';

const validJson = {
  "scriptpubkey": "00142b8e837dfcff6f04987c57dc21a05e13f9951bd0",
  "scriptpubkey_asm":
      "OP_0 OP_PUSHBYTES_20 2b8e837dfcff6f04987c57dc21a05e13f9951bd0",
  "scriptpubkey_type": "v0_p2wpkh",
  "scriptpubkey_address": "tb1q9w8gxl0ulahsfxru2lwzrgz7z0ue2x7ss2ldvf",
  "value": 13826039196,
};

void main() {
  test('Vout constructor', () {
    var vout = Vout(
        "00142b8e837dfcff6f04987c57dc21a05e13f9951bd0",
        "OP_0 OP_PUSHBYTES_20 2b8e837dfcff6f04987c57dc21a05e13f9951bd0",
        "v0_p2wpkh",
        null,
        13826039196);
    expect(vout.scriptpubkey, "00142b8e837dfcff6f04987c57dc21a05e13f9951bd0");
    expect(vout.scriptpubkeyAsm,
        "OP_0 OP_PUSHBYTES_20 2b8e837dfcff6f04987c57dc21a05e13f9951bd0");
    expect(vout.scriptpubkeyType, "v0_p2wpkh");
    expect(vout.scriptpubkeyAddress, null);
    expect(vout.value, 13826039196);
  });

  test('Vout.fromJson', () {
    var vout = Vout.fromJson(validJson);
    expect(vout.scriptpubkey, "00142b8e837dfcff6f04987c57dc21a05e13f9951bd0");
    expect(vout.scriptpubkeyAsm,
        "OP_0 OP_PUSHBYTES_20 2b8e837dfcff6f04987c57dc21a05e13f9951bd0");
    expect(vout.scriptpubkeyType, "v0_p2wpkh");
    expect(
        vout.scriptpubkeyAddress, "tb1q9w8gxl0ulahsfxru2lwzrgz7z0ue2x7ss2ldvf");
    expect(vout.value, 13826039196);
  });

  test('Vout.toJson', () {
    var vout = Vout.fromJson(validJson);
    expect(vout.toJson(), validJson);
  });

  test('Vout should throws', () {
    var invalidJson = {
      "scriptpubkey": "invalid",
      "scriptpubkey_asm": "invalid",
      "scriptpubkey_type": "invalid",
      "scriptpubkey_address": "invalid",
      "value": -1,
    };
    expect(() => Vout.fromJson(invalidJson), throwsException);
  });
}
