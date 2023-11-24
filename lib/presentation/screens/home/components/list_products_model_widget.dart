import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/item_product_model.dart';
import 'package:s_factory/presentation/screens/home/blocs/home_bloc/home_bloc.dart';
import 'package:s_factory/presentation/screens/home/components/item_product_model_widget.dart';

class ListProductsModelWidget extends StatelessWidget {
  ListProductsModelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState state) {
              final int total = state.listProductModel?.length ?? 0;
              return Text(
                'Đã nhập $total mẫu',
                style: WowTextTheme.ts24w600(context),
              );
            },
          ),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (_, HomeState state) {
                logi(
                    message:
                        'state.listProductModel:${state.listProductModel}');
                final List<ProductModel> listItem =
                    state.listProductModel ?? <ProductModel>[];
                return Padding(
                  padding: EdgeInsets.all(16.w),
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductModelWidget(
                          item: listItem[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                            height: 8.h,
                          ),
                      itemCount: listItem.length),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
