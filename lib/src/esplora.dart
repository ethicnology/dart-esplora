import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:esplora/esplora.dart';

class Esplora {
  Uri url;

  Esplora(this.url);

  // TRANSACTIONS

  /// Returns information about the transaction.
  Future<Transaction> getTx(String txid) async {
    var response = await http.get(Uri.parse("$url/api/tx/$txid"));
    dynamic json = jsonDecode(response.body);
    return Transaction.fromJson(json);
  }

  /// Returns the transaction confirmation status.
  Future<Status> getTxStatus(String txid) async {
    var response = await http.get(Uri.parse("$url/api/tx/$txid/status"));
    dynamic json = jsonDecode(response.body);
    return Status.fromJson(json);
  }

  /// Returns the raw transaction in hex data.
  Future<String> getTxHex(String txid) async {
    var response = await http.get(Uri.parse("$url/api/tx/$txid/hex"));
    return response.body;
  }

  /// Returns a merkle inclusion proof for the transaction using bitcoind's merkleblock format.
  /// Note: This endpoint is not currently available for Liquid/Elements-based chains.
  Future<String> getTxMerkleblockProof(String txid) async {
    var response =
        await http.get(Uri.parse("$url/api/tx/$txid/merkleblock-proof"));
    return response.body;
  }

  /// Returns a merkle inclusion proof for the transaction using Electrum's blockchain.transaction.get_merkle format.
  Future<MerkleProof> getTxMerkleProof(String txid) async {
    var response = await http.get(Uri.parse("$url/api/tx/$txid/merkle-proof"));
    dynamic json = jsonDecode(response.body);
    return MerkleProof.fromJson(json);
  }

  /// Returns the spending status of a transaction output.
  Future<Outspend> getTxOutspend(String txid, int vout) async {
    var response =
        await http.get(Uri.parse("$url/api/tx/$txid/outspend/$vout"));
    dynamic json = jsonDecode(response.body);
    return Outspend.fromJson(json);
  }

  /// Returns the spending status of all transaction outputs.
  Future<List<Outspend>> getTxOutspends(String txid) async {
    var response = await http.get(Uri.parse("$url/api/tx/$txid/outspends"));
    List<dynamic> json = jsonDecode(response.body);
    List<Outspend> result = [];
    for (var item in json) {
      result.add(Outspend.fromJson(item));
    }
    return result;
  }

  // TODO: POST /tx
  // Broadcast a raw transaction to the network.
  // The transaction should be provided as hex in the request body. The txid will be returned on success.

  // ADDRESSES

  /// Get information about an address.
  Future<Map<String, Stats>> getAddress(String address) async {
    var response = await http.get(Uri.parse("$url/api/address/$address"));
    dynamic json = jsonDecode(response.body);
    Map<String, Stats> result = {};
    result['chain'] = Stats.fromJson(json['chain_stats']);
    result['mempool'] = Stats.fromJson(json['mempool_stats']);
    return result;
  }

  /// Get the list of unspent transaction outputs associated with the address.
  /// FIXME: Elements-based chains have a valuecommitment field that may appear in place of value, plus the following additional fields: asset/assetcommitment, nonce/noncecommitment, surjection_proof and range_proof.
  Future<List<Utxo>> getAddressUtxo(String address) async {
    var response = await http.get(Uri.parse("$url/api/address/$address/utxo"));
    List<dynamic> json = jsonDecode(response.body);
    List<Utxo> result = [];
    for (var item in json) {
      result.add(Utxo.fromJson(item));
    }
    return result;
  }

  /// Get transaction history for the specified address, sorted with newest first.
  /// Returns up to 50 mempool transactions plus the first 25 confirmed transactions.
  Future<List<Transaction>> getAddressTxs(String address) async {
    var response = await http.get(Uri.parse("$url/api/address/$address/txs"));
    List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
    List<Transaction> result = [];
    for (var item in json) {
      result.add(Transaction.fromJson(item));
    }
    return result;
  }

  /// Get transaction history for the specified address, sorted with newest first.
  /// Returns 25 transactions per page. More can be requested by specifying the last txid seen by the previous query.
  Future<List<Transaction>> getAddressTxsChain(String address,
      {String lastSeenTxid = ""}) async {
    var response = await http
        .get(Uri.parse("$url/api/address/$address/txs/chain/$lastSeenTxid"));
    List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
    List<Transaction> result = [];
    for (var item in json) {
      result.add(Transaction.fromJson(item));
    }
    return result;
  }

  /// Get unconfirmed transaction history for the specified address.
  /// Returns up to 50 transactions (no paging).
  Future<List<Transaction>> getAddressTxsMempool(String address) async {
    var response =
        await http.get(Uri.parse("$url/api/address/$address/txs/mempool"));
    List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
    List<Transaction> result = json.map((i) => i as Transaction).toList();
    return result;
  }

  /// Search for addresses beginning with prefix.
  /// Returns a JSON array with up to 10 results.
  Future<List<String>> getAddressPrefix(String prefix) async {
    var response = await http.get(Uri.parse("$url/api/address-prefix/$prefix"));
    List<dynamic> json = jsonDecode(response.body);
    List<String> result = json.map((i) => i as String).toList();
    return result;
  }

  // BLOCKS

  /// Returns information about a block.
  Future<Block> getBlock(String hash) async {
    var response = await http.get(Uri.parse("$url/api/block/$hash"));
    dynamic json = jsonDecode(response.body);
    return Block.fromJson(json);
  }

  /// Returns the hex-encoded block header.
  Future<String> getBlockHeader(String hash) async {
    var response = await http.get(Uri.parse("$url/api/block/$hash/header"));
    return response.body;
  }

  /// Returns the block status.
  Future<BlockStatus> getBlockStatus(String hash) async {
    var response = await http.get(Uri.parse("$url/api/block/$hash/status"));
    dynamic json = jsonDecode(response.body);
    return BlockStatus.fromJson(json);
  }

  /// Returns a list of transactions in the block (up to 25 transactions beginning at start_index).
  Future<List<Transaction>> getBlockTxs(String hash,
      {String startIndex = ""}) async {
    var response =
        await http.get(Uri.parse("$url/api/block/$hash/txs/$startIndex"));
    List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
    List<Transaction> result = [];
    for (var item in json) {
      result.add(Transaction.fromJson(item));
    }
    return result;
  }

  /// Returns a list of all txids in the block.
  Future<List<String>> getBlockTxids(String hash) async {
    var response = await http.get(Uri.parse("$url/api/block/$hash/txids"));
    List<dynamic> json = jsonDecode(response.body);
    List<String> result = json.map((i) => i as String).toList();
    return result;
  }

  /// Returns the transaction at index :index within the specified block.
  Future<String> getBlockTxid(String hash, int index) async {
    var response =
        await http.get(Uri.parse("$url/api/block/$hash/txid/$index"));
    return response.body;
  }

  /// Returns the hash of the block currently at height.
  Future<String> getBlockHeight(int height) async {
    var response = await http.get(Uri.parse("$url/api/block-height/$height"));
    return response.body;
  }

  /// Returns the 10 newest blocks starting at the tip or at start_height if specified.
  Future<List<Block>> getBlocks({int? height}) async {
    var response = await http.get(Uri.parse("$url/api/blocks/$height"));
    List<dynamic> json = jsonDecode(response.body);
    List<Block> result = [];
    for (var item in json) {
      result.add(Block.fromJson(item));
    }
    return result;
  }

  /// Returns the height of the last block.
  Future<int> getBlocksTipHeight() async {
    var response = await http.get(Uri.parse("$url/api/blocks/tip/height"));
    return int.parse(response.body);
  }

  /// Returns the hash of the last block.
  Future<String> getBlocksTipHash() async {
    var response = await http.get(Uri.parse("$url/api/blocks/tip/hash"));
    return response.body;
  }

  // Mempool

  /// Get mempool backlog statistics.
  Future<Mempool> getMempool() async {
    var response = await http.get(Uri.parse("$url/api/mempool"));
    dynamic json = jsonDecode(response.body);
    Mempool result = Mempool.fromJson(json);
    return result;
  }

  /// Get the full list of txids in the mempool as an array.
  /// The order of the txids is arbitrary and does not match bitcoind's.
  Future<List<String>> getMempoolTxids() async {
    var response = await http.get(Uri.parse("$url/api/mempool/txids"));
    List<dynamic> json = jsonDecode(response.body);
    List<String> result = json.map((i) => i as String).toList();
    return result;
  }

  /// Get a list of the last 10 transactions to enter the mempool.
  /// Each transaction object contains simplified overview data, with the following fields: txid, fee, vsize and value
  Future<List<MempoolRecent>> getMempoolRecent() async {
    var response = await http.get(Uri.parse("$url/api/mempool/recent"));
    List<dynamic> json = jsonDecode(response.body);
    List<MempoolRecent> result =
        json.map((i) => MempoolRecent.fromJson(i)).toList();
    return result;
  }

  // Fees

  /// Get an object where the key is the confirmation target (in number of blocks) and the value is the estimated feerate (in sat/vB).
  /// The available confirmation targets are 1-25, 144, 504 and 1008 blocks.
  Future<Map<String, num>> getFeeEstimates() async {
    var response = await http.get(Uri.parse("$url/api/fee-estimates"));
    Map<String, num> result = Map<String, num>.from(jsonDecode(response.body));
    return result;
  }
}
