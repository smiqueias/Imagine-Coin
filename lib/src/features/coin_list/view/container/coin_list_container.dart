import 'package:cryptocurrency_app/src/core/components/loading_component.dart';
import 'package:cryptocurrency_app/src/features/coin_list/cubit/coin_cubit.dart';
import 'package:cryptocurrency_app/src/features/coin_list/repository/coin_repository.dart';
import 'package:cryptocurrency_app/src/features/coin_list/service/dio_service.dart';
import 'package:cryptocurrency_app/src/features/coin_list/view/screen/coin_list_error_screen.dart';
import 'package:cryptocurrency_app/src/features/coin_list/view/screen/coin_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinListContainer extends StatelessWidget {
  const CoinListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CoinCubit(CoinRepository(DioService())),
          child:
              BlocBuilder<CoinCubit, CoinCubitState>(builder: (context, state) {
            if (state is CoinCubitLoading) {
              return const LoadingComponent();
            } else if (state is CoinCubitLoaded) {
              return CoinListScreen(
                coinModel: state.coinModel,
                state: context.read<CoinCubit>(),
              );
            } else if (state is CoinCubitError) {
              return CoinListErrorScreen(
                state: state,
                coinCubit: context.read<CoinCubit>(),
              );
            }
            return const SizedBox.shrink();
          }),
        ),
      ),
    );
  }
}
