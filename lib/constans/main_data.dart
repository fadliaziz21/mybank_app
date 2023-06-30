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
}
