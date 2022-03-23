import 'package:esplora/esplora.dart';
import 'package:test/test.dart';

/// These tests relies on mainnet transactions that can be spent in the future.
final url = Uri.parse("https://blockstream.info/");

/// Mempool is dynamic, check esplora answer still match the class
void main() {
  test('getFeeEstimates', () async {
    var esplora = Esplora(url);
    Map<String, num> estimates = await esplora.getFeeEstimates();
    expect(estimates.isNotEmpty, true);
  });
}
