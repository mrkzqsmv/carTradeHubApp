import 'package:car_trade_hub_app/models/favouriteAnounceModel.dart';
import 'package:flutter/material.dart';

class FavouriteAnounceProvider with ChangeNotifier {
  final List<FavouriteAnounce> _favouriteAnounces = [];

  List<FavouriteAnounce> get favouriteAnounces => _favouriteAnounces;

  void addToFavourites(FavouriteAnounce favouriteAnounce) {
    _favouriteAnounces.add(favouriteAnounce);
    notifyListeners();
  }

  void removeFromFavourites(String anounceID) {
    _favouriteAnounces.removeWhere(
        (favouriteAnounce) => favouriteAnounce.anounceID == anounceID);
    notifyListeners();
  }
}
