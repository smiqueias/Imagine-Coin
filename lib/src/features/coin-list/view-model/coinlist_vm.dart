import 'package:cryptocurrency_app/src/features/coin-list/model/coin_model.dart';
import 'package:cryptocurrency_app/src/features/coin-list/repository/i_coin_repository.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class ICoinListVM extends ChangeNotifier {
  bool get isLoading;
  bool get isError;
  String get errorMessage;
  List<Data> get selectedCoins;
  CoinModel get coin;
  Future<void> fetchCoins();
  void addSelectedCoin(Data coin);
  void removeSelectedCoin(Data coin);
  void clear();
}

class CoinListVM extends ChangeNotifier implements ICoinListVM {
  final ICoinRepository repository;
  CoinListVM({required this.repository}) {
    fetchCoins();
  }

  bool _isLoading = false;

  String _errorMessage = "";

  late CoinModel _coin;

  final List<Data> _selectedCoins = [];

  @override
  CoinModel get coin => _coin;

  @override
  List<Data> get selectedCoins => _selectedCoins;

  @override
  String get errorMessage => _errorMessage;

  @override
  bool get isError => _errorMessage.isNotEmpty;

  @override
  bool get isLoading => _isLoading;

  void _setLoading({bool value = false}) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError({String value = ""}) {
    _errorMessage = value;
    notifyListeners();
  }

  @override
  Future<void> fetchCoins() async {
    try {
      bool hasInternet = await InternetConnectionChecker().hasConnection;
      _setError(value: "");
      if (hasInternet) {
        _setLoading(value: true);
        _coin = await repository.fetchCoins();
      } else {
        _setError(value: "Verifique sua conexão e tente novamente!");
      }
    } catch (e, st) {
      developer.log(
        "Error in CoinListVM",
        name: "Imagine Coin Logs",
        error: e,
        stackTrace: st,
      );
      _setError(value: "Erro ao buscar os dados das moedas.");
    } finally {
      _setLoading();
    }
  }

  @override
  void addSelectedCoin(Data coin) {
    _selectedCoins.add(coin);
    notifyListeners();
  }

  @override
  void removeSelectedCoin(Data coin) {
    _selectedCoins.remove(coin);
    notifyListeners();
  }

  @override
  void clear() {
    _selectedCoins.clear();
    notifyListeners();
  }
}
