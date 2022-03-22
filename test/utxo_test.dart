import 'package:esplora/src/status.dart';
import 'package:esplora/src/utxo.dart';
import 'package:test/test.dart';

const validJson = {
  "txid": "3937b79a3e3ea9f26bd284f696afc6e6cd426bc0182b213f88f9338d2bb2d96d",
  "vout": 1,
  "status": {
    "confirmed": true,
    "block_height": 2190517,
    "block_hash":
        "00000000000000e11283a2828be52fb7e94264de722c98fd0d1221be7efd7429",
    "block_time": 1647732997
  },
  "value": 100000
};

void main() {
  test('Utxo constructor', () {
    var utxo = Utxo(
        "3937b79a3e3ea9f26bd284f696afc6e6cd426bc0182b213f88f9338d2bb2d96d",
        1,
        100000,
        Status(
            true,
            2190517,
            "00000000000000e11283a2828be52fb7e94264de722c98fd0d1221be7efd7429",
            1647732997));
    expect(utxo.txid,
        "3937b79a3e3ea9f26bd284f696afc6e6cd426bc0182b213f88f9338d2bb2d96d");
    expect(utxo.vout, 1);
    expect(utxo.value, 100000);
    expect(utxo.status.confirmed, true);
  });

  test('Utxo.fromJson', () {
    var utxo = Utxo.fromJson(validJson);
    expect(utxo.txid,
        "3937b79a3e3ea9f26bd284f696afc6e6cd426bc0182b213f88f9338d2bb2d96d");
    expect(utxo.vout, 1);
    expect(utxo.value, 100000);
    expect(utxo.status.confirmed, true);
  });

  test('Utxo.toJson', () {
    var utxo = Utxo.fromJson(validJson);
    expect(utxo.toJson(), validJson);
  });

  test('Utxo invalid values throws', () {
    var invalidJson = {
      "txid": "invalid",
      "vout": -1,
      "status": {
        "confirmed": false,
        "block_height": -1,
        "block_hash": "invalid",
        "block_time": -1
      },
      "value": -1
    };
    expect(() => Utxo.fromJson(invalidJson), throwsException);
  });
}
