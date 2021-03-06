# dart-esplora 
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Dart CI](https://github.com/ethicnology/dart-esplora/actions/workflows/dart.yml/badge.svg?branch=main)](https://github.com/ethicnology/dart-esplora/actions/workflows/dart.yml)
[![pub package](https://img.shields.io/pub/v/esplora.svg)](https://pub.dartlang.org/packages/esplora)
[![codecov](https://codecov.io/gh/ethicnology/dart-esplora/branch/main/graph/badge.svg?token=RZ7O009HQY)](https://codecov.io/gh/ethicnology/dart-esplora)  

[Blockstream Esplora](https://github.com/Blockstream/esplora) wrapper for dart

## Getting started
### From pub.dev
```sh
dart pub add esplora
```

```yaml
dependencies: 
  esplora: ^1.0.0
```

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

#### GET /address/:address/txs/chain/:last_seen_txid(optional)
```dart
getAddressTxsChain(String address);
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

### Blocks
#### GET /block/:hash
```dart
getBlock(String hash);
```

#### GET /block/:hash/header
```dart
getBlockHeader(String hash);
```

#### GET /block/:hash/status
```dart
getBlockStatus(String hash);
```

#### GET /block/:hash/txs/:start_index(optional)
```dart
getBlockTxs(String hash);
getBlockTxs(String hash, startIndex: String);
```

#### GET /block/:hash/txids
```dart
getBlockTxids(String hash);
```

#### GET /block/:hash/txid/:index
```dart
getBlockTxid(String hash, int index);
```

#### GET /block-height/:height
```dart
getBlockHeight(int height);
```

#### GET /blocks/:start_height(optional)
```dart
getBlocks();
getBlocks(startHeight: int);
```

#### GET /blocks/tip/height
```dart
getBlocksTipHeight();
```

#### GET /blocks/tip/hash
```dart
getBlocksTipHash();
```

### Mempool
#### GET /mempool
```dart
getMempool();
```

#### GET /mempool/txids
```dart
getMempoolTxids();
```

#### GET /mempool/recent
```dart
getMempoolRecent();
```

### Fee 
#### GET /fee-estimates
```dart
getFeeEstimates();
```
