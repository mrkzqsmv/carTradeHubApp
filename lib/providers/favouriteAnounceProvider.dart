import 'package:car_trade_hub_app/models/favouriteAnounceModel.dart';
import 'package:flutter/material.dart';

class FavouriteAnnounceProvider with ChangeNotifier {
  List<FavouriteAnnounce> _favouriteAnnounces = [];

  List<FavouriteAnnounce> get favouriteAnounces => _favouriteAnnounces;

  void addToFavorites(FavouriteAnnounce favouriteAnounce) async {
    _favouriteAnnounces.add(favouriteAnounce);
    notifyListeners();
  }

  void removeFromFavourites(String anounceID) {
    _favouriteAnnounces.removeWhere(
        (favouriteAnounce) => favouriteAnounce.announceID == anounceID);
    notifyListeners();
  }
}
