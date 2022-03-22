# dart-esplora 
[Blockstream Esplora](https://github.com/Blockstream/esplora) wrapper for dart

## Getting started
### From Github
```yaml
dependencies:
  esplora:
    git:
      url: https://github.com/ethicnology/dart-esplora.git
      ref: main
```

## Usage
```dart
  final url = Uri.parse("https://blockstream.info/");
  const address = "1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa";
  const txid =
      "e6b148846d7db3367aab6ea46a64e27528764f36581dec6ffc2326e3af2af874";
  var esplora = Esplora(url);

  Transaction tx = await esplora.getTx(txid);
  print(tx.txid);

  List<Transaction> txs = await esplora.getAddressTxs(address);
  print(txs[0].txid);
```

### Transactions
#### GET /tx/:txid
```dart
getTx(String txid);
```

#### GET /tx/:txid/status
```dart
getTxStatus(String txid);
```

#### GET /tx/:txid/hex
```dart
getTxHex(String txid);
```

#### GET /tx/:txid/merkleblock-proof
```dart
getTxMerkleblockProof(String txid);
```

#### GET /tx/:txid/merkle-proof
```dart
getTxMerkleProof(String txid);
```

#### GET /tx/:txid/outspend/:vout
```dart
getTxOutspend(String txid, int vout);
```

#### GET /tx/:txid/outspends
```dart
getTxOutspends(String txid);
```

### Addresses
#### GET /address/:address
```dart
getAddress(String address);
```

#### GET /address/:address/txs
```dart
getAddressTxs(String address);
```

#### GET /address/:address/txs/chain/:last_seen_txid
```dart
getAddressTxsChain(String address, String lastSeenTxid: "");
```

#### GET /address/:address/utxo
```dart
getAddressUtxo(String address);
```

#### GET /address/:address/txs/mempool
```dart
getAddressUtxoMempool(String address);
```

#### GET /address-prefix/:prefix
```dart
getAddressPrefix(String prefix);
```
