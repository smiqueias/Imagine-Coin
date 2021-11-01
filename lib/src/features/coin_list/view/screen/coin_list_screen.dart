import 'package:cryptocurrency_app/src/core/app_colors.dart';
import 'package:cryptocurrency_app/src/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinListScreen extends StatelessWidget {
  const CoinListScreen({Key? key}) : super(key: key);

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
                    Container(
                      margin: EdgeInsets.only(right: 18.w),
                      child: Text(
                        "24h",
                        style: AppTextStyles.heading18,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () => {},
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 12.h),
                        height: 83.h,
                        width: 399.w,
                        decoration: BoxDecoration(
                          color: AppColors.grey1,
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 12.w),
                              height: 50.h,
                              width: 50.w,
                              decoration: const BoxDecoration(
                                color: AppColors.grey4,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.coronavirus_outlined,
                                color: Colors.amber,
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "Bitcoin (BTC)",
                              style: AppTextStyles.text18,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              "R\$ 354.787,00",
                              style: AppTextStyles.text18,
                            ),
                            SizedBox(
                              width: 60.w,
                            ),
                            Text(
                              "-1.57%",
                              style: AppTextStyles.text18Orange,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
