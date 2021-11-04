import 'dart:io';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:cryptocurrency_app/src/features/coin_list/model/coin_model.dart';
import 'package:cryptocurrency_app/src/features/coin_list/repository/i_coin_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'coincubit_state.dart';

class CoinCubit extends Cubit<CoinCubitState> {
  final ICoinRepository _coinRepository;

  CoinCubit(this._coinRepository) : super(const CoinCubitInitial()) {
    fetchCoins();
  }

  Future<void> fetchCoins() async {
    try {
      bool hasInternet = await InternetConnectionChecker().hasConnection;
      if (hasInternet) {
        emit(const CoinCubitLoading());
        final coins = await _coinRepository.fetchCoins();
        emit(CoinCubitLoaded(coins));
      } else {
        emit(const CoinCubitError("Verifique sua conexão e tente novamente!"));
      }
    } catch (e, st) {
      developer.log(
        "Error in CoinRepository",
        name: "Imagine Coin Logs",
        error: e,
        stackTrace: st,
      );
      emit(const CoinCubitError("Erro ao buscar os dados das moedas."));
    }
  }
}
