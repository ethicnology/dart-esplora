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

  test('getTxMerkleblockProof', () async {
    var esplora = Esplora(url);
    String proof = await esplora.getTxMerkleblockProof(txid);
    expect(proof,
        "0420b0300746d09afd12fe07e5ee0b0ea537a2e7b0332fd4391e020000000000000000000d5daaab4f253825603351817f07e7657a322f36257007e8acc3b71ad82ed28b3cfd3862c0400a17292e538e980700000cb2d2718719847e5ec5ea1bac897b6ca422b071a89d3c5d033e206d058efbc71cae10c738dc24cabc495b4ad48a5a91573ba3508877267c987434d53d9624bbe2578477c5555dc7a1e71f7c3302347b1083ecf5d39538e4346cb8f7a0786480bf1c88f3b189735fd711c6e05dd5f79f5af5257217405059d6bf24295edfea25a96f9c5157de285e9b51e864bc53a96e815fc0bf3718b7e60d35b30011def34f79c6d35a1711cb74499d6d5bf81bcb13c800159be4a8a9fd977c24a1aad1ea8954def7d2a91861e4dc95dc06dc7da2c4a91b6b4d09325b5d91808b514510d675f51b6c6654b1d71c5c413037e856cb811ee5f1c9f1e8b088636c4073e6197c95f2cabfcf46b343b069ee008e1eb740f825a4882d871416bc139d338ddae602988686ad9d8639f763f82c64d31df1dec9d855058e09f994288e31719321423c11b9a4365ac5587ce9f76de26f3c2169d33432e7c8c0867966ecc505796f5efab8f3f77bec74bb58d8ea3cff25a847ee89a03a9f18fdd090451c6c6e67ac6c945dfe03ab5b05");
  });
}
