import 'package:pet_catan/models/advert_card.dart';

class TEST {
  static TEST test = TEST();

  List<AdCard> adverts() {
    AdCard a1 = AdCard();
    a1.imagePaths = [
      'assets/images/kuymo.jpeg',
      'assets/images/1.jpeg',
      'assets/images/2.jpeg'
    ];
    a1.title = "Kuymak Bey";
    AdCard a2 = AdCard();
    a2.imagePaths = [
      'assets/images/1.jpeg',
      'assets/images/kuymo.jpeg',
      'assets/images/2.jpeg'
    ];
    a2.title = "Kuymak Paşa";
    AdCard a3 = AdCard();
    a3.imagePaths = [
      'assets/images/2.jpeg',
      'assets/images/kuymo.jpeg',
      'assets/images/1.jpeg',
    ];
    a3.title = "Kuymak Efendi";
    return [a1, a2, a3, a1, a2, a3, a1, a2, a3];
  }
}
