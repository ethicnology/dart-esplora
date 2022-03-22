import 'package:esplora/src/status.dart';
import 'package:test/test.dart';

const validJson = {
  "confirmed": true,
  "block_height": 2190517,
  "block_hash":
      "00000000000000e11283a2828be52fb7e94264de722c98fd0d1221be7efd7429",
  "block_time": 1647732997
};

void main() {
  test('Status constructor', () {
    var status = Status(
        true,
        2190517,
        "00000000000000e11283a2828be52fb7e94264de722c98fd0d1221be7efd7429",
        1647732997);
    expect(status.confirmed, true);
    expect(status.blockHeight, 2190517);
    expect(status.blockHash,
        "00000000000000e11283a2828be52fb7e94264de722c98fd0d1221be7efd7429");
    expect(status.blockTime, 1647732997);
  });

  test('Status.fromJson', () {
    var status = Status.fromJson(validJson);
    expect(status.confirmed, true);
    expect(status.blockHeight, 2190517);
    expect(status.blockHash,
        "00000000000000e11283a2828be52fb7e94264de722c98fd0d1221be7efd7429");
    expect(status.blockTime, 1647732997);
  });

  test('Status.toJson', () {
    var status = Status.fromJson(validJson);
    expect(status.toJson(), validJson);
  });

  test('Status confirmed false -> blockHeight, blockHash, blockTime = null',
      () {
    var unconfirmedStatus = {
      "confirmed": false,
    };
    Status unconfirmed = Status.fromJson(unconfirmedStatus);
    expect(unconfirmed.blockHeight, null);
    expect(unconfirmed.blockHash, null);
    expect(unconfirmed.blockTime, null);
  });

  test('Status should throws', () {
    var invalidJson = {
      "confirmed": true,
      "block_height": -1,
      "block_hash": "invalid",
      "block_time": -1
    };
    expect(() => Status.fromJson(invalidJson), throwsException);
  });
}
