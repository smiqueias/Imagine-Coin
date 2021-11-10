import 'package:cryptocurrency_app/src/core/app_colors.dart';
import 'package:cryptocurrency_app/src/core/app_text_styles.dart';
import 'package:cryptocurrency_app/src/features/coin-list/model/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CoinDetailScreen extends StatefulWidget {
  const CoinDetailScreen({Key? key, required this.coinData}) : super(key: key);
  final Data coinData;

  @override
  State<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> {
  final NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: "R\$");
  double convertedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 32.0.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.network(
                    widget.coinData.imageUrl,
                    width: 70.w,
                  ),
                ),
                SizedBox(
                  width: 16.0.w,
                ),
                Text(
                  real.format(double.tryParse(widget.coinData.latest)),
                  style: AppTextStyles.heading26,
                )
              ],
            ),
          ),
          SizedBox(
            height: 40.0.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Container(
              height: 20.0.h,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "$convertedValue ${widget.coinData.base}",
                style: AppTextStyles.text18Green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              onChanged: (value) {
                convertedValue = (value.isEmpty)
                    ? 0
                    : (double.tryParse(value)! /
                        double.tryParse(widget.coinData.latest)!);
                setState(() {});
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value!.isEmpty) {
                  return "Insira um valor";
                } else if (double.tryParse(value)! < 0) {
                  return "Insira um valor maior que 0";
                }
                return null;
              },
              style: AppTextStyles.text18,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey1,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey1,
                  ),
                ),
                labelText: "Valor",
                labelStyle: AppTextStyles.text18,
                prefixIcon: const Icon(Icons.monetization_on_outlined),
                suffix: Text(
                  "reais",
                  style: AppTextStyles.text18,
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
