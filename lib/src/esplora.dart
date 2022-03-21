import 'dart:convert';
import 'package:http/http.dart' as http;
import 'stats.dart';
import 'transaction.dart';
import 'utxo.dart';

class Esplora {
  Uri url;

  Esplora(this.url);

  Future<Map<String, Stats>> getAddress(String address) async {
    var response = await http.get(Uri.parse("$url/api/address/$address"));
    dynamic json = jsonDecode(response.body);
    Map<String, Stats> result = {};
    result['chain'] = Stats.fromJson(json['chain_stats']);
    result['mempool'] = Stats.fromJson(json['mempool_stats']);
    return result;
  }

  Future<List<Utxo>> getAddressUtxo(String address) async {
    var response = await http.get(Uri.parse("$url/api/address/$address/utxo"));
    List<dynamic> json = jsonDecode(response.body);
    List<Utxo> result = [];
    for (var item in json) {
      result.add(Utxo.fromJson(item));
    }
    return result;
  }

  Future<List<Transaction>> getAddressTxs(String address) async {
    var response = await http.get(Uri.parse("$url/api/address/$address/txs"));
    List<dynamic> json = jsonDecode(response.body) as List<dynamic>;
    List<Transaction> result = [];
    for (var item in json) {
      result.add(Transaction.fromJson(item));
    }
    return result;
  }

  Future<List<String>> getAddressPrefix(String prefix) async {
    var response = await http.get(Uri.parse("$url/api/address-prefix/$prefix"));
    List<String> result = (jsonDecode(response.body) as List<dynamic>)
        .map((i) => i as String)
        .toList();
    return result;
  }
}
