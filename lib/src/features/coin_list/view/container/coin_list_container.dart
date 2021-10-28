import 'package:flutter/material.dart';

class CoinListContainer extends StatelessWidget {
  const CoinListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
        ),
      ),
    );
  }
}
