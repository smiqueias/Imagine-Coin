import 'package:cryptocurrency_app/src/features/coin-list/model/coin_model.dart';
import 'package:cryptocurrency_app/src/features/coin-list/repository/i_coin_repository.dart';
import 'package:cryptocurrency_app/src/features/coin-list/service/i_dio_service.dart';
import 'dart:developer' as developer;

class CoinRepository implements ICoinRepository {
  final IDioService _dioService;

  CoinRepository(this._dioService);

  @override
  Future<CoinModel> fetchCoins() async {
    try {
      final response = await _dioService.getDio().get("assets/search?base=BRL");
      return CoinModel.fromJson(response.data);
    } catch (e, st) {
      developer.log(
        "Error in CoinRepository",
        name: "Imagine Coin Logs",
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
