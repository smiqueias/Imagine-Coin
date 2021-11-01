import 'package:cryptocurrency_app/src/core/app_colors.dart';
import 'package:cryptocurrency_app/src/core/app_text_styles.dart';
import 'package:cryptocurrency_app/src/features/coin_list/view/screen/coin_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinListContainer extends StatelessWidget {
  const CoinListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CoinListScreen();
  }
}
