import 'package:esplora/src/outspend.dart';
import 'package:test/test.dart';

const validJson = {
  "spent": true,
  "txid": "f2957c19e673406c6388b0e8f1c9f1e51e81cb56e83730415c1cd7b154666c1b",
  "vin": 0,
  "status": {
    "confirmed": true,
    "block_height": 728418,
    "block_hash":
        "00000000000000000006aa48d85e9229454621c0addbd2bbda4e3d280eade466",
    "block_time": 1647902012
  }
};

void main() {
  test('Outspend constructor', () {
    var outspend = Outspend(false, null, null, null);
    expect(outspend.spent, false);
  });

  test('Outspend.fromJson', () {
    var outspend = Outspend.fromJson(validJson);
    expect(outspend.spent, true);
    expect(outspend.vin, 0);
    expect(outspend.status!.confirmed, true);
    expect(outspend.status!.blockHeight, 728418);
    expect(outspend.status!.blockHash,
        "00000000000000000006aa48d85e9229454621c0addbd2bbda4e3d280eade466");
    expect(outspend.status!.blockTime, 1647902012);
  });

  test('Outspend.toJson spent == false', () {
    var json = {'spent': false};
    var merkle = Outspend.fromJson(json);
    expect(merkle.toJson(), json);
  });

  test('Outspend.toJson spent == true', () {
    var merkle = Outspend.fromJson(validJson);
    expect(merkle.toJson(), validJson);
  });

  test('Outspend should throws', () {
    var invalidJson = {
      "spent": true,
      "txid": "invalid",
      "vin": -1,
      "status": {
        "confirmed": true,
        "block_height": -1,
        "block_hash": "invalid",
        "block_time": -1
      }
    };
    expect(() => Outspend.fromJson(invalidJson), throwsException);
  });
}
