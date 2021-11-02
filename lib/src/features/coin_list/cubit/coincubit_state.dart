part of 'coin_cubit.dart';

abstract class CoinCubitState extends Equatable {
  const CoinCubitState();

  @override
  List<Object> get props => [];
}

class CoinCubitInitial extends CoinCubitState {
  const CoinCubitInitial();
}

class CoinCubitLoading extends CoinCubitState {
  const CoinCubitLoading();
}

class CoinCubitLoaded extends CoinCubitState {
  final CoinModel coinModel;

  const CoinCubitLoaded(this.coinModel);

  @override
  List<Object> get props => [coinModel];
}

class CoinCubitError extends CoinCubitState {
  final String _errorMessage;

  const CoinCubitError(this._errorMessage);

  @override
  List<Object> get props => [_errorMessage];
}
