import 'package:esplora/esplora.dart';
import 'package:test/test.dart';

const validJson = {
  "txid": "0dea8db9764257c6805fd0757df76cd4e9673feb084e4ae23586a50d9aab80f6",
  "fee": 1152,
  "vsize": 140,
  "value": 90556,
};

void main() {
  test('MempoolRecent constructor', () {
    var recent = MempoolRecent(
        "0dea8db9764257c6805fd0757df76cd4e9673feb084e4ae23586a50d9aab80f6",
        1152,
        140,
        90556);
    expect(recent.txid,
        "0dea8db9764257c6805fd0757df76cd4e9673feb084e4ae23586a50d9aab80f6");
    expect(recent.fee, 1152);
    expect(recent.vsize, 140);
    expect(recent.value, 90556);
  });

  test('MempoolRecent.fromJson', () {
    var recent = MempoolRecent.fromJson(validJson);
    expect(recent.txid,
        "0dea8db9764257c6805fd0757df76cd4e9673feb084e4ae23586a50d9aab80f6");
    expect(recent.fee, 1152);
    expect(recent.vsize, 140);
    expect(recent.value, 90556);
  });

  test('MempoolRecent.toJson', () {
    var merkle = MempoolRecent.fromJson(validJson);
    expect(merkle.toJson(), validJson);
  });

  test('MempoolRecent should throws', () {
    var invalidJson = {
      "txid": "invalid",
      "fee": -1,
      "vsize": -1,
      "value": -1,
    };
    expect(() => MempoolRecent.fromJson(invalidJson), throwsException);
  });
}
