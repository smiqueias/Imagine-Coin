import 'package:cryptocurrency_app/src/core/app_colors.dart';
import 'package:cryptocurrency_app/src/core/app_text_styles.dart';
import 'package:cryptocurrency_app/src/features/coin_list/cubit/coin_cubit.dart';
import 'package:cryptocurrency_app/src/features/coin_list/model/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CoinListScreen extends StatefulWidget {
  final CoinModel coinModel;
  final CoinCubit state;

  const CoinListScreen({Key? key, required this.coinModel, required this.state})
      : super(key: key);

  @override
  State<CoinListScreen> createState() => _CoinListScreenState();
}

class _CoinListScreenState extends State<CoinListScreen> {
  final NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: "R\$");

  var selected = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 40.h,
                  right: 40.h,
                  top: 50.w,
                  bottom: 12.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Moeda",
                      style: AppTextStyles.heading18,
                    ),
                    Text(
                      "Cotação",
                      style: AppTextStyles.heading18,
                    ),
                    Text(
                      "24h",
                      style: AppTextStyles.heading18,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => widget.state.fetchCoins(),
                  child: ListView.builder(
                    itemCount: widget.coinModel.data.length,
                    itemBuilder: (context, index) {
                      var percentChangeInDay = (widget.coinModel.data[index]
                                  .latestPrice.percentChange.day! *
                              100)
                          .toStringAsFixed(1);

                      var latestPrice =
                          double.tryParse(widget.coinModel.data[index].latest)!;

                      return GestureDetector(
                        onLongPress: () => {
                          (selected.contains(widget.coinModel.data[index]))
                              ? selected.remove(widget.coinModel.data[index])
                              : selected.add(widget.coinModel.data[index]),
                          setState(() {})
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 12.h),
                          height: 83.h,
                          width: 399.w,
                          decoration: BoxDecoration(
                            color: (selected
                                    .contains(widget.coinModel.data[index]))
                                ? AppColors.orange2.withOpacity(0.1)
                                : AppColors.grey1,
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 12.w),
                                height: 50.h,
                                width: 50.w,
                                decoration: const BoxDecoration(
                                  color: AppColors.grey4,
                                  shape: BoxShape.circle,
                                ),
                                child: (selected
                                        .contains(widget.coinModel.data[index]))
                                    ? const Icon(
                                        Icons.check,
                                        color: AppColors.orange,
                                      )
                                    : Image.network(
                                        widget.coinModel.data[index].imageUrl,
                                      ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                widget.coinModel.data[index].name,
                                style: AppTextStyles.text18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                real.format(latestPrice),
                                style: AppTextStyles.text18,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: 60.w,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 4.w),
                                child: Text(
                                  "$percentChangeInDay%",
                                  style: AppTextStyles.text18Orange,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
