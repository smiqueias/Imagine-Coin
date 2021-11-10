import 'package:cryptocurrency_app/src/features/coin-detail/view/container/coin_detail_container.dart';
import 'package:cryptocurrency_app/src/features/coin-list/model/coin_model.dart';
import 'package:flutter/material.dart';

class CoinDetailRouter extends StatelessWidget {
  const CoinDetailRouter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;
    return CoinDetailContainer(
      coinData: args,
    );
  }
}
