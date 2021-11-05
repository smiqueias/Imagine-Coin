import 'package:cryptocurrency_app/src/features/coin-list/model/coin_model.dart';

abstract class ICoinRepository {
  Future<CoinModel> fetchCoins();
}
