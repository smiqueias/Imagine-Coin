import 'package:cryptocurrency_app/src/features/coin-list/repository/coin_repository.dart';
import 'package:cryptocurrency_app/src/features/coin-list/repository/i_coin_repository.dart';
import 'package:cryptocurrency_app/src/features/coin-list/service/dio_service.dart';
import 'package:cryptocurrency_app/src/features/coin-list/service/i_dio_service.dart';
import 'package:cryptocurrency_app/src/features/coin-list/view-model/coinlist_vm.dart';
import 'package:cryptocurrency_app/src/features/favorites/view-model/favorites_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    Provider<IDioService>(create: (_) => DioService()),
    Provider<ICoinRepository>(
        create: (context) => CoinRepository(context.read())),
    ChangeNotifierProvider<ICoinListVM>(
        create: (context) => CoinListVM(repository: context.read())),
    ChangeNotifierProvider<IFavoritesVM>(create: (context) => FavoritesVM())
  ];
}
