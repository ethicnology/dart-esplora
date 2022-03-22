import 'package:esplora/esplora.dart';

void main() async {
  final url = Uri.parse("https://blockstream.info/");
  const address = "1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa";
  var esplora = Esplora(url);

  Map<String, Stats> stats = await esplora.getAddress(address);
  print(stats['chain']!.fundedTxoSum);

  List<Transaction> txs = await esplora.getAddressTxs(address);
  print(txs[0].txid);

  List<Transaction> txsChain = await esplora.getAddressTxsChain(address,
      lastSeenTxid: "76a91462e907b15cbf27d5425399ebf6f0fb50ebb88f1888ac");
  print(txsChain[0].txid);

  List<Utxo> utxo = await esplora.getAddressUtxo(address);
  print(utxo[0].value);

  await esplora.getAddressTxsMempool(address);

  List<String> addresses = await esplora.getAddressPrefix("11111111111111");
  print(addresses[0]);
}
