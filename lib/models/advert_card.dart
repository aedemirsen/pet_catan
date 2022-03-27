import 'package:flutter/material.dart';

import 'pet.dart';
import 'user.dart';

class AdCard {
  ///image
  List<String>? _imagePaths;

  ///image
  List<String>? get imagePaths => _imagePaths;

  ///image
  set imagePaths(List<String>? image) {
    _imagePaths = image;
  }

  ///advert type -- petçatan or petsahiplen
  String? _type;

  ///advert type -- petçatan or petsahiplen
  String? get type => _type;

  ///advert type -- petçatan or petsahiplen
  set type(String? type) {
    _type = type;
  }

  ///title
  String? _title;

  ///title
  String? get title => _title;

  ///title
  set title(String? title) {
    _title = title;
  }

  ///subtitle
  String? _subtitle;

  ///subtitle
  String? get subtitle => _subtitle;

  ///subtitle
  set subtitle(String? subtitle) {
    _subtitle = subtitle;
  }

  ///explanation
  String? _explanation;

  ///explanation
  String? get explanation => _explanation;

  ///explanation
  set explanation(String? explanation) {
    _explanation = explanation;
  }

  ///pet
  Pet? _pet;

  ///pet
  Pet? get pet => _pet;

  ///pet
  set pet(Pet? pet) {
    _pet = pet;
  }

  ///advertiser
  User? _advertiser;

  ///advertiser
  User? get advertiser => _advertiser;

  ///advertiser
  set advertiser(User? advertiser) {
    _advertiser = advertiser;
  }
}
