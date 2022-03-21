import 'dart:convert';
import 'package:http/http.dart' as http;
import 'stats.dart';

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
}
