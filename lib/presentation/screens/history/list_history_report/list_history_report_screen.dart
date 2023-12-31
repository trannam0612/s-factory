import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/bloc/list_report_history_bloc.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/components/input_search_widget.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/components/list_result_report_widget.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_appbar_widget.dart';
import 'package:s_factory/presentation/widgets/s_back_button_widget%20.dart';
import 'package:s_factory/presentation/widgets/s_cricel_avatar_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';

class ListHistoryReportScreen extends StatefulWidget {
  const ListHistoryReportScreen({super.key});
  static const String pathRoute = 'listHistoryReportRoute';

  @override
  State<ListHistoryReportScreen> createState() =>
      _ListHistoryReportScreenState();
}

class _ListHistoryReportScreenState extends State<ListHistoryReportScreen> {
  late ListReportHistoryBloc _historyBloc;

  @override
  void initState() {
    super.initState();
    _historyBloc = getIt();
    _historyBloc.add(GetListReportHistoryEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SScaffoldWidget(
      isScroll: false,
      appBar: SAppBarWidget(
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: SvgPicture.asset(
            SvgPaths.icLogo,
          ),
        ),
        leadingWidth: 150.w,
        action: <Widget>[
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  32.w,
                ),
                color: ColorConstant.kPrimary02,
              ),
              child: Row(
                children: <Widget>[
                  SCricleAvatarWidget(
                    size: 32.w,
                    urlImage:
                        'https://st.quantrimang.com/photos/image/2021/08/16/Anh-vit-cute-6.jpg',
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(SvgPaths.icMenu)
                ],
              ),
            ),
          )
        ],
      ),
      body: BlocProvider<ListReportHistoryBloc>(
        create: (BuildContext context) => _historyBloc,
        child: BlocListener<ListReportHistoryBloc, ListReportHistoryState>(
          listener: (BuildContext context, ListReportHistoryState state) {
            switch (state.getListReportHistoryState) {
              case LoadState.loading:
                if (state.listReport?.isEmpty == true) {
                  context.read<AppBloc>().add(OnShowLoadingEvent());
                }

                break;
              case LoadState.failure:
                context.read<AppBloc>().add(OnHideLoadingEvent());
                getIt<NavigationService>().openDialog(
                  title: 'Lỗi',
                  content: state.message,
                  onTap: () {
                    getIt<NavigationService>().pop();
                  },
                );
                break;
              case LoadState.success:
                context.read<AppBloc>().add(OnHideLoadingEvent());

                break;
              default:
            }
          },
          child: Column(
            children: <Widget>[
              Container(
                color: ColorConstant.kSupportInfo,
                padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 16.w),
                child: Column(
                  children: <Widget>[
                    const SBackButtonWidget(
                      title: 'Lịch sử báo cáo',
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    const InputSearchWidget()
                  ],
                ),
              ),
              Expanded(child: ListResultReportWidget())
            ],
          ),
        ),
      ),
    );
  }
}
