import 'package:esplora/esplora.dart';
import 'package:esplora/src/merkle_proof.dart';
import 'package:esplora/src/outspend.dart';

void main() async {
  final url = Uri.parse("https://blockstream.info/");
  const address = "1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa";
  const txid =
      "e6b148846d7db3367aab6ea46a64e27528764f36581dec6ffc2326e3af2af874";
  var esplora = Esplora(url);

  // Transactions
  Transaction tx = await esplora.getTx(txid);
  print(tx.txid);

  Status status = await esplora.getTxStatus(txid);
  print(status.confirmed);

  String hex = await esplora.getTxHex(txid);
  print(hex);

  String proof = await esplora.getTxMerkleblockProof(txid);
  print(proof);

  MerkleProof proof2 = await esplora.getTxMerkleProof(txid);
  print(proof2.blockHeight);

  Outspend outspend = await esplora.getTxOutspend(txid, 0);
  print(outspend.spent);

  List<Outspend> outspends = await esplora.getTxOutspends(txid);
  print(outspends[0].spent);

  // Addresses
  Map<String, Stats> stats = await esplora.getAddress(address);
  print(stats['chain']!.fundedTxoSum);

  List<Transaction> txs = await esplora.getAddressTxs(address);
  print(txs[0].txid);

  List<Transaction> txsChain = await esplora.getAddressTxsChain(address,
      lastSeenTxid: "76a91462e907b15cbf27d5425399ebf6f0fb50ebb88f1888ac");
  print(txsChain[0].txid);

  // esplora throws : "too many history entries" because satoshi has too much utxo
  // List<Utxo> utxo = await esplora.getAddressUtxo(address);
  // print(utxo[0].value);

  await esplora.getAddressTxsMempool(address);

  List<String> addresses = await esplora.getAddressPrefix("11111111111111");
  print(addresses[0]);
}
