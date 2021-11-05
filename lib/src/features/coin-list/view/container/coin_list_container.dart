import 'package:cryptocurrency_app/src/core/components/loading_component.dart';
import 'package:cryptocurrency_app/src/features/coin-list/view-model/coinlist_vm.dart';
import 'package:cryptocurrency_app/src/features/coin-list/view/screen/coin_list_error_screen.dart';
import 'package:cryptocurrency_app/src/features/coin-list/view/screen/coin_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinListContainer extends StatelessWidget {
  const CoinListContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ICoinListVM>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const LoadingComponent();
          } else if (viewModel.isError) {
            return CoinListErrorScreen(vieModel: viewModel);
          }
          return CoinListScreen(vieModel: viewModel);
        },
      ),
    );
  }
}
