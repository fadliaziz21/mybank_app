import 'package:mybank_app/constans/assets.dart';

class AppData {
  static Map<int, dynamic> cardType = {
    1: {
      'cardName': 'Silver',
      'cardImage': Assets.savingsCardImg[1],
    },
    2: {
      'cardName': 'Gold',
      'cardImage': Assets.savingsCardImg[2],
    },
    3: {
      'cardName': 'Platinum',
      'cardImage': Assets.savingsCardImg[3],
    },
    4: {
      'cardName': 'Priority',
      'cardImage': Assets.savingsCardImg[4],
    },
  };

  static Map<int, dynamic> transactionType = {
    1: {
      'transactionType': 'income',
      'transactionImage': Assets.transactionImg[1],
      'transactionName': 'Transfer',
    },
    2: {
      'transactionType': 'outcome',
      'transactionImage': Assets.transactionImg[2],
      'transactionName': 'Transfer',
    },
    3: {
      'transactionType': 'outcome',
      'transactionImage': Assets.transactionImg[3],
      'transactionName': 'Payment',
    },
  };
}
