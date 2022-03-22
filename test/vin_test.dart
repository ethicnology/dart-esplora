import 'package:esplora/src/vin.dart';
import 'package:esplora/src/vout.dart';
import 'package:test/test.dart';

const validJson = {
  "txid": "2ca1dadc02292c3e575ae8fbd1c0f0636d9a0a2bb6a85c7fbeb12b610110ffc2",
  "vout": 0,
  "prevout": {
    "scriptpubkey": "0014300bb84cf28c58e1aeb1578cc45911ab306b38f7",
    "scriptpubkey_asm":
        "OP_0 OP_PUSHBYTES_20 300bb84cf28c58e1aeb1578cc45911ab306b38f7",
    "scriptpubkey_type": "v0_p2wpkh",
    "scriptpubkey_address": "tb1qxq9msn8j33vwrt4327xvgkg34vcxkw8hr7ghqh",
    "value": 13827180144,
  },
  "scriptsig": "",
  "scriptsig_asm": "",
  "witness": [
    "304402202bcfc87950edfacdecb9c5cdb0095003a4ef95c9247f863fc869131acfb7af3202207da62685cdc4c32e32ea90967fe9901aca40a28294b51db959834cb0386da6a101",
    "0250c9d976c413530a09fe90f03414e640c7cf5e6b143fb501323b1e177d5b81d9"
  ],
  "is_coinbase": false,
  "sequence": 4294967294,
};

void main() {
  test('Vin constructor', () {
    var vin = Vin(
        "2ca1dadc02292c3e575ae8fbd1c0f0636d9a0a2bb6a85c7fbeb12b610110ffc2",
        0,
        Vout(
            "0014300bb84cf28c58e1aeb1578cc45911ab306b38f7",
            "OP_0 OP_PUSHBYTES_20 300bb84cf28c58e1aeb1578cc45911ab306b38f7",
            "v0_p2wpkh",
            "tb1qxq9msn8j33vwrt4327xvgkg34vcxkw8hr7ghqh",
            13827180144),
        "",
        "",
        [
          "304402202bcfc87950edfacdecb9c5cdb0095003a4ef95c9247f863fc869131acfb7af3202207da62685cdc4c32e32ea90967fe9901aca40a28294b51db959834cb0386da6a101",
          "0250c9d976c413530a09fe90f03414e640c7cf5e6b143fb501323b1e177d5b81d9"
        ],
        false,
        4294967294);
    expect(vin.txid,
        "2ca1dadc02292c3e575ae8fbd1c0f0636d9a0a2bb6a85c7fbeb12b610110ffc2");
    expect(vin.vout, 0);
    expect(vin.prevout!.value, 13827180144);
    expect(vin.scriptsig, "");
    expect(vin.scriptsigAsm, "");
    expect(vin.witness[1],
        "0250c9d976c413530a09fe90f03414e640c7cf5e6b143fb501323b1e177d5b81d9");
    expect(vin.isCoinbase, false);
    expect(vin.sequence, 4294967294);
  });

  test('Vin.fromJson', () {
    var vin = Vin.fromJson(validJson);
    expect(vin.txid,
        "2ca1dadc02292c3e575ae8fbd1c0f0636d9a0a2bb6a85c7fbeb12b610110ffc2");
    expect(vin.vout, 0);
    expect(vin.prevout!.value, 13827180144);
    expect(vin.scriptsig, "");
    expect(vin.scriptsigAsm, "");
    expect(vin.witness[1],
        "0250c9d976c413530a09fe90f03414e640c7cf5e6b143fb501323b1e177d5b81d9");
    expect(vin.isCoinbase, false);
    expect(vin.sequence, 4294967294);
  });

  test('Vin.toJson', () {
    var vin = Vin.fromJson(validJson);
    expect(vin.toJson(), validJson);
  });

  test('Vin invalid values throws', () {
    var invalidJson = {
      "txid": "invalid",
      "vout": -1,
      "prevout": {
        "scriptpubkey": "0014300bb84cf28c58e1aeb1578cc45911ab306b38f7",
        "scriptpubkey_asm":
            "OP_0 OP_PUSHBYTES_20 300bb84cf28c58e1aeb1578cc45911ab306b38f7",
        "scriptpubkey_type": "v0_p2wpkh",
        "scriptpubkey_address": "tb1qxq9msn8j33vwrt4327xvgkg34vcxkw8hr7ghqh",
        "value": 13827180144,
      },
      "scriptsig": "",
      "scriptsig_asm": "",
      "witness": [
        "0250c9d976c413530a09fe90f03414e640c7cf5e6b143fb501323b1e177d5b81d9"
      ],
      "is_coinbase": false,
      "sequence": -1,
    };
    expect(() => Vin.fromJson(invalidJson), throwsException);
  });
}
