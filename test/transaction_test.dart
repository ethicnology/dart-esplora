import 'package:esplora/src/status.dart';
import 'package:esplora/src/transaction.dart';
import 'package:esplora/src/vin.dart';
import 'package:esplora/src/vout.dart';
import 'package:test/test.dart';

const validJson = {
  "txid": "d66bacacca849b17bae2daab37114bd5417480b5fc057d71127cdd032103cabc",
  "version": 2,
  "locktime": 2190516,
  "vin": [
    {
      "txid":
          "2ca1dadc02292c3e575ae8fbd1c0f0636d9a0a2bb6a85c7fbeb12b610110ffc2",
      "vout": 0,
      "prevout": {
        "scriptpubkey": "0014300bb84cf28c58e1aeb1578cc45911ab306b38f7",
        "scriptpubkey_asm":
            "OP_0 OP_PUSHBYTES_20 300bb84cf28c58e1aeb1578cc45911ab306b38f7",
        "scriptpubkey_type": "v0_p2wpkh",
        "scriptpubkey_address": "tb1qxq9msn8j33vwrt4327xvgkg34vcxkw8hr7ghqh",
        "value": 13827180144
      },
      "scriptsig": "",
      "scriptsig_asm": "",
      "witness": [
        "304402202bcfc87950edfacdecb9c5cdb0095003a4ef95c9247f863fc869131acfb7af3202207da62685cdc4c32e32ea90967fe9901aca40a28294b51db959834cb0386da6a101",
        "0250c9d976c413530a09fe90f03414e640c7cf5e6b143fb501323b1e177d5b81d9"
      ],
      "is_coinbase": false,
      "sequence": 4294967294
    }
  ],
  "vout": [
    {
      "scriptpubkey": "00142b8e837dfcff6f04987c57dc21a05e13f9951bd0",
      "scriptpubkey_asm":
          "OP_0 OP_PUSHBYTES_20 2b8e837dfcff6f04987c57dc21a05e13f9951bd0",
      "scriptpubkey_type": "v0_p2wpkh",
      "scriptpubkey_address": "tb1q9w8gxl0ulahsfxru2lwzrgz7z0ue2x7ss2ldvf",
      "value": 13826039196
    },
    {
      "scriptpubkey": "00142d6f6fe7c8bc987b95244761915363dfd9d1a6ac",
      "scriptpubkey_asm":
          "OP_0 OP_PUSHBYTES_20 2d6f6fe7c8bc987b95244761915363dfd9d1a6ac",
      "scriptpubkey_type": "v0_p2wpkh",
      "scriptpubkey_address": "tb1q94hkle7ghjv8h9fygasez5mrmlvarf4vhfjzlq",
      "value": 1126724
    }
  ],
  "size": 222,
  "weight": 561,
  "fee": 14224,
  "status": {
    "confirmed": true,
    "block_height": 2190517,
    "block_hash":
        "00000000000000e11283a2828be52fb7e94264de722c98fd0d1221be7efd7429",
    "block_time": 1647732997
  }
};

void main() {
  test('Transaction constructor', () {
    var tx = Transaction(
      "d66bacacca849b17bae2daab37114bd5417480b5fc057d71127cdd032103cabc",
      2,
      2190516,
      [
        Vin(
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
            4294967294)
      ],
      [
        Vout(
            "00142b8e837dfcff6f04987c57dc21a05e13f9951bd0",
            "OP_0 OP_PUSHBYTES_20 2b8e837dfcff6f04987c57dc21a05e13f9951bd0",
            "v0_p2wpkh",
            "tb1q9w8gxl0ulahsfxru2lwzrgz7z0ue2x7ss2ldvf",
            13826039196),
        Vout(
            "00142d6f6fe7c8bc987b95244761915363dfd9d1a6ac",
            "OP_0 OP_PUSHBYTES_20 2d6f6fe7c8bc987b95244761915363dfd9d1a6ac",
            "v0_p2wpkh",
            "tb1q94hkle7ghjv8h9fygasez5mrmlvarf4vhfjzlq",
            1126724)
      ],
      222,
      561,
      14224,
      Status(
          true,
          2190517,
          "00000000000000e11283a2828be52fb7e94264de722c98fd0d1221be7efd7429",
          1647732997),
    );
    expect(tx.txid,
        "d66bacacca849b17bae2daab37114bd5417480b5fc057d71127cdd032103cabc");
    expect(tx.version, 2);
    expect(tx.locktime, 2190516);
    expect(tx.vin[0].txid,
        "2ca1dadc02292c3e575ae8fbd1c0f0636d9a0a2bb6a85c7fbeb12b610110ffc2");
    expect(tx.vout[0].scriptpubkey,
        "00142b8e837dfcff6f04987c57dc21a05e13f9951bd0");
    expect(tx.size, 222);
    expect(tx.weight, 561);
    expect(tx.fee, 14224);
    expect(tx.status.blockHeight, 2190517);
  });

  test('Transaction.fromJson', () {
    var tx = Transaction.fromJson(validJson);
    expect(tx.txid,
        "d66bacacca849b17bae2daab37114bd5417480b5fc057d71127cdd032103cabc");
    expect(tx.version, 2);
    expect(tx.locktime, 2190516);
    expect(tx.vin[0].txid,
        "2ca1dadc02292c3e575ae8fbd1c0f0636d9a0a2bb6a85c7fbeb12b610110ffc2");
    expect(tx.vout[0].scriptpubkey,
        "00142b8e837dfcff6f04987c57dc21a05e13f9951bd0");
    expect(tx.size, 222);
    expect(tx.weight, 561);
    expect(tx.fee, 14224);
    expect(tx.status.blockHeight, 2190517);
  });

  test('Transaction.toJson', () {
    var tx = Transaction.fromJson(validJson);
    expect(tx.toJson(), validJson);
  });

  test('Transaction invalid values throws', () {
    var invalidJson = {
      "txid": "invalid",
      "version": -1,
      "locktime": -1,
      "vin": [
        {
          "txid":
              "2ca1dadc02292c3e575ae8fbd1c0f0636d9a0a2bb6a85c7fbeb12b610110ffc2",
          "vout": 0,
          "prevout": {
            "scriptpubkey": "0014300bb84cf28c58e1aeb1578cc45911ab306b38f7",
            "scriptpubkey_asm":
                "OP_0 OP_PUSHBYTES_20 300bb84cf28c58e1aeb1578cc45911ab306b38f7",
            "scriptpubkey_type": "v0_p2wpkh",
            "scriptpubkey_address":
                "tb1qxq9msn8j33vwrt4327xvgkg34vcxkw8hr7ghqh",
            "value": 13827180144
          },
          "scriptsig": "",
          "scriptsig_asm": "",
          "witness": [
            "304402202bcfc87950edfacdecb9c5cdb0095003a4ef95c9247f863fc869131acfb7af3202207da62685cdc4c32e32ea90967fe9901aca40a28294b51db959834cb0386da6a101",
            "0250c9d976c413530a09fe90f03414e640c7cf5e6b143fb501323b1e177d5b81d9"
          ],
          "is_coinbase": false,
          "sequence": 4294967294
        }
      ],
      "vout": [
        {
          "scriptpubkey": "00142b8e837dfcff6f04987c57dc21a05e13f9951bd0",
          "scriptpubkey_asm":
              "OP_0 OP_PUSHBYTES_20 2b8e837dfcff6f04987c57dc21a05e13f9951bd0",
          "scriptpubkey_type": "v0_p2wpkh",
          "scriptpubkey_address": "tb1q9w8gxl0ulahsfxru2lwzrgz7z0ue2x7ss2ldvf",
          "value": 13826039196
        }
      ],
      "size": -1,
      "weight": -1,
      "fee": -1,
      "status": {
        "confirmed": true,
        "block_height": 2190517,
        "block_hash":
            "00000000000000e11283a2828be52fb7e94264de722c98fd0d1221be7efd7429",
        "block_time": 1647732997
      }
    };
    expect(() => Transaction.fromJson(invalidJson), throwsException);
  });
}
