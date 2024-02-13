import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavouriteAnnounceProvider with ChangeNotifier {
  List<QueryDocumentSnapshot<Object?>> _favouriteAnnounces = [];

  List<QueryDocumentSnapshot<Object?>> get favouriteAnounces =>
      _favouriteAnnounces;


  void addToFavorites(QueryDocumentSnapshot<Object?> data) async {
    _favouriteAnnounces.add(data);
    notifyListeners();
  }

  void removeFromFavourites(String anounceID) {
    _favouriteAnnounces
        .removeWhere((favouriteAnounce) => favouriteAnounce.id == anounceID);
    notifyListeners();
  }
}
