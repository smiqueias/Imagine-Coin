import 'package:cryptocurrency_app/src/features/coin-list/model/coin_model.dart';
import 'package:flutter/material.dart';

abstract class IFavoritesVM extends ChangeNotifier {
  List<Data> get favorites;

  void addFavorite(List<Data> favorite);

  void removeFavorite(CoinModel favorite);

  void removeAllFavorites();
}

class FavoritesVM extends ChangeNotifier implements IFavoritesVM {
  List<Data> _favorites = [];

  @override
  void addFavorite(List<Data> coinData) {
    coinData.forEach((element) {
      if (!_favorites.contains(element)) {
        _favorites.add(element);
      }
    });
    notifyListeners();
  }

  @override
  List<Data> get favorites => _favorites;

  @override
  void removeAllFavorites() {
    _favorites.clear();
    notifyListeners();
  }

  @override
  void removeFavorite(CoinModel favorite) {
    _favorites.remove(favorite);
    notifyListeners();
  }
}
