import 'package:cryptocurrency_app/src/core/app_colors.dart';
import 'package:cryptocurrency_app/src/core/app_text_styles.dart';
import 'package:cryptocurrency_app/src/features/coin-list/view-model/coinlist_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinListErrorScreen extends StatelessWidget {
  final ICoinListVM vieModel;
  const CoinListErrorScreen({Key? key, required this.vieModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            vieModel.errorMessage,
            style: AppTextStyles.errorTextStyle,
          ),
        ),
        SizedBox(height: 12.h),
        OutlinedButton(
          onPressed: () => vieModel.fetchCoins(),
          child: Text(
            "Tentar Novamente",
            style: AppTextStyles.errorTextStyleButton,
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.grey1,
          ),
        )
      ],
    );
  }
}
