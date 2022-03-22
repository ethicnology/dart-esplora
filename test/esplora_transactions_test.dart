import 'package:esplora/esplora.dart';
import 'package:test/test.dart';

/// These tests relies on mainnet transactions that can be spent in the future.
final url = Uri.parse("https://blockstream.info/");
const txid = "f2957c19e673406c6388b0e8f1c9f1e51e81cb56e83730415c1cd7b154666c1b";

Map<String, dynamic> json = {
  "txid": "f2957c19e673406c6388b0e8f1c9f1e51e81cb56e83730415c1cd7b154666c1b",
  "version": 2,
  "locktime": 0,
  "vin": [
    {
      "txid":
          "dca87fe24dfe3f308014ed4b6a91ad39ae06c7ee279eb14b1b78645f90cef36d",
      "vout": 1,
      "prevout": {
        "scriptpubkey": "a914d55b0664b2479da7a455971c6a707efba7e272e787",
        "scriptpubkey_asm":
            "OP_HASH160 OP_PUSHBYTES_20 d55b0664b2479da7a455971c6a707efba7e272e7 OP_EQUAL",
        "scriptpubkey_type": "p2sh",
        "scriptpubkey_address": "3M98tvsmxcySwf6VdQrMDkY7JRG74UgF3t",
        "value": 274396
      },
      "scriptsig": "1600143d288f785510bc675f574a864ee66dda10aeb3bf",
      "scriptsig_asm":
          "OP_PUSHBYTES_22 00143d288f785510bc675f574a864ee66dda10aeb3bf",
      "witness": [
        "3045022100b03680f3a86473afb9fd041d898501fb7d6d34f34fb9299f0e58dd230d7d83030220699d0fc4cf75352d9cc29af088c0657f70527d643b8c9f2ec74ec2acccec8ba201",
        "0347c65015a69aafc5cca9ad0c4b02f0d6318d6bb2253ffabfbddfc6fabe0053f0"
      ],
      "is_coinbase": false,
      "sequence": 4294967295,
      "inner_redeemscript_asm":
          "OP_0 OP_PUSHBYTES_20 3d288f785510bc675f574a864ee66dda10aeb3bf",
      "inner_witnessscript_asm":
          "" // this field is omitted in the original response
    }
  ],
  "vout": [
    {
      "scriptpubkey": "76a91404f2923ad0c41b1f934492b77813c3a20f355ce188ac",
      "scriptpubkey_asm":
          "OP_DUP OP_HASH160 OP_PUSHBYTES_20 04f2923ad0c41b1f934492b77813c3a20f355ce1 OP_EQUALVERIFY OP_CHECKSIG",
      "scriptpubkey_type": "p2pkh",
      "scriptpubkey_address": "1TAHuoo6tKwZCyPja1mkkYQxmNZBW9HYP",
      "value": 1312
    },
    {
      "scriptpubkey": "76a9144e3ef5a6e0970aef88e6446a45fb9b824f85ab1f88ac",
      "scriptpubkey_asm":
          "OP_DUP OP_HASH160 OP_PUSHBYTES_20 4e3ef5a6e0970aef88e6446a45fb9b824f85ab1f OP_EQUALVERIFY OP_CHECKSIG",
      "scriptpubkey_type": "p2pkh",
      "scriptpubkey_address": "188j8UKA3PVzXBrji2GWRsF95iKz41KUtP",
      "value": 272529
    }
  ],
  "size": 252,
  "weight": 678,
  "fee": 555,
  "status": {
    "confirmed": true,
    "block_height": 728418,
    "block_hash":
        "00000000000000000006aa48d85e9229454621c0addbd2bbda4e3d280eade466",
    "block_time": 1647902012
  }
};

void main() {
  test('getTx', () async {
    var esplora = Esplora(url);
    Transaction tx = await esplora.getTx(txid);
    expect(tx.toJson(), json);
  });

  test('getTxStatus', () async {
    var esplora = Esplora(url);
    Status tx = await esplora.getTxStatus(txid);
    expect(tx.confirmed, true);
    expect(tx.blockHeight, 728418);
    expect(tx.blockHash,
        "00000000000000000006aa48d85e9229454621c0addbd2bbda4e3d280eade466");
    expect(tx.blockTime, 1647902012);
  });

  test('getTxHex', () async {
    var esplora = Esplora(url);
    String hex = await esplora.getTxHex(txid);
    expect(hex,
        "020000000001016df3ce905f64781b4bb19e27eec706ae39ad916a4bed1480303ffe4de27fa8dc01000000171600143d288f785510bc675f574a864ee66dda10aeb3bfffffffff0220050000000000001976a91404f2923ad0c41b1f934492b77813c3a20f355ce188ac91280400000000001976a9144e3ef5a6e0970aef88e6446a45fb9b824f85ab1f88ac02483045022100b03680f3a86473afb9fd041d898501fb7d6d34f34fb9299f0e58dd230d7d83030220699d0fc4cf75352d9cc29af088c0657f70527d643b8c9f2ec74ec2acccec8ba201210347c65015a69aafc5cca9ad0c4b02f0d6318d6bb2253ffabfbddfc6fabe0053f000000000");
  });
}
