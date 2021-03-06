import 'package:cryptocurrency_app/src/core/app_colors.dart';
import 'package:cryptocurrency_app/src/core/app_text_styles.dart';
import 'package:cryptocurrency_app/src/features/coin-list/view-model/coinlist_vm.dart';
import 'package:cryptocurrency_app/src/features/favorites/view-model/favorites_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';

class CoinListScreen extends StatelessWidget {
  final ICoinListVM viewModel;
  final Future<void> Function() onRefresh;
  final NumberFormat real = NumberFormat.currency(locale: "pt_BR", name: "R\$");
  late IFavoritesVM favoritesVM;

  CoinListScreen({Key? key, required this.viewModel, required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    favoritesVM = context.watch<IFavoritesVM>();

    return Scaffold(
      appBar: viewModel.selectedCoins.isNotEmpty
          ? AppBar(
              title: Text("${viewModel.selectedCoins.length} Selecionada(s)"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  viewModel.clear();
                },
              ),
            )
          : null,
      floatingActionButton: viewModel.selectedCoins.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                favoritesVM.addFavorite(viewModel.selectedCoins);
                viewModel.clear();
                print(favoritesVM.favorites.length);
              },
              icon: const Icon(
                Icons.favorite,
                color: AppColors.orange2,
              ),
              label: Text(
                "Favoritar",
                style: AppTextStyles.floatingActionButtonTextStyle,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                      "Cota????o",
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
                  onRefresh: onRefresh,
                  child: ListView.builder(
                    itemCount: viewModel.coin.data.length,
                    itemBuilder: (context, index) {
                      var percentChangeInDay = (viewModel.coin.data[index]
                                  .latestPrice.percentChange.day! *
                              100)
                          .toStringAsFixed(1);

                      var latestPrice =
                          double.tryParse(viewModel.coin.data[index].latest)!;

                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          "/coin-detail",
                          arguments: viewModel.coin.data[index],
                        ),
                        onLongPress: () => {
                          (viewModel.selectedCoins
                                  .contains(viewModel.coin.data[index]))
                              ? viewModel.removeSelectedCoin(
                                  viewModel.coin.data[index])
                              : viewModel
                                  .addSelectedCoin(viewModel.coin.data[index])
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 12.h),
                          height: 83.h,
                          width: 399.w,
                          decoration: BoxDecoration(
                            color: (viewModel.selectedCoins
                                    .contains(viewModel.coin.data[index]))
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
                                child: (viewModel.selectedCoins
                                        .contains(viewModel.coin.data[index]))
                                    ? const Icon(
                                        Icons.check,
                                        color: AppColors.orange,
                                      )
                                    : Image.network(
                                        viewModel.coin.data[index].imageUrl,
                                      ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                viewModel.coin.data[index].name,
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
                                width: 35.w,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 4.w),
                                child: Text(
                                  "$percentChangeInDay%",
                                  style: (double.tryParse(percentChangeInDay)! >
                                          0.0)
                                      ? AppTextStyles.text18Green
                                      : AppTextStyles.text18Orange,
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
