import 'package:cryptocurrency_app/src/features/coin_list/model/coin_model.dart';

abstract class ICoinRepository {
  Future<CoinModel> fetchCoins();
}
