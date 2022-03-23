import 'utils.dart';

class Stats {
  late int fundedTxoCount;
  late int fundedTxoSum;
  late int spentTxoCount;
  late int spentTxoSum;
  late int txCount;

  Stats(this.fundedTxoCount, this.fundedTxoSum, this.spentTxoCount,
      this.spentTxoSum, this.txCount) {
    isNonnegativeInt(fundedTxoCount);
    isNonnegativeInt(fundedTxoSum);
    isNonnegativeInt(spentTxoCount);
    isNonnegativeInt(spentTxoSum);
  }

  Stats.fromJson(Map<String, dynamic> json) {
    fundedTxoCount = json['funded_txo_count'];
    fundedTxoSum = json['funded_txo_sum'];
    spentTxoCount = json['spent_txo_count'];
    spentTxoSum = json['spent_txo_sum'];
    txCount = json['tx_count'];
    isNonnegativeInt(fundedTxoCount);
    isNonnegativeInt(fundedTxoSum);
    isNonnegativeInt(spentTxoCount);
    isNonnegativeInt(spentTxoSum);
  }

  Map<String, dynamic> toJson() => {
        'funded_txo_count': fundedTxoCount,
        'funded_txo_sum': fundedTxoSum,
        'spent_txo_count': spentTxoCount,
        'spent_txo_sum': spentTxoSum,
        'tx_count': txCount,
      };
}
