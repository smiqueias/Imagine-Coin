import 'package:cryptocurrency_app/src/features/coin-detail/view/screens/coin_detail_screen.dart';
import 'package:cryptocurrency_app/src/features/coin-list/model/coin_model.dart';
import 'package:flutter/material.dart';

class CoinDetailContainer extends StatelessWidget {
  const CoinDetailContainer({Key? key, required this.coinData})
      : super(key: key);

  final Data coinData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinData.name),
      ),
      body: SafeArea(
        child: CoinDetailScreen(
          coinData: coinData,
        ),
      ),
    );
  }
}
