import 'dart:io';
import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:cryptocurrency_app/src/features/coin_list/model/coin_model.dart';
import 'package:cryptocurrency_app/src/features/coin_list/repository/i_coin_repository.dart';
import 'package:equatable/equatable.dart';

part 'coincubit_state.dart';

class CoinCubit extends Cubit<CoinCubitState> {
  final ICoinRepository _coinRepository;

  CoinCubit(this._coinRepository) : super(const CoinCubitInitial()) {
    fetchCoins();
  }

  Future<void> fetchCoins() async {
    try {
      emit(const CoinCubitLoading());
      final coins = await _coinRepository.fetchCoins();
      emit(CoinCubitLoaded(coins));
    } on SocketException catch (e, st) {
      developer.log(
        "Error in CoinCubit",
        name: "Imagine Coin Logs",
        error: e,
        stackTrace: st,
      );
      emit(const CoinCubitError("Verifique sua conexão e tente novamente!"));
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
