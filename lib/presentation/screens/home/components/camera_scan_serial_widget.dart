import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nested/nested.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/screens/home/blocs/camera_scan_bloc/camera_scan_bloc.dart';
import 'package:s_factory/presentation/screens/home/blocs/home_bloc/home_bloc.dart';
import 'package:s_factory/presentation/screens/home/components/scanner_background_widget.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_back_button_widget%20.dart';

class CameraScanSerialWidget extends StatefulWidget {
  const CameraScanSerialWidget({
    super.key,
  });

  @override
  State<CameraScanSerialWidget> createState() => _CameraScanSerialWidgetState();
}

class _CameraScanSerialWidgetState extends State<CameraScanSerialWidget>
    with WidgetsBindingObserver {
  late MobileScannerController controller;

  late CameraScanBloc _cameraScanBloc;
  late HomeBloc _homeBloc;

  @override
  void initState() {
    controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      cameraResolution: Size(1024, 390),
    );
    _cameraScanBloc = getIt();
    _homeBloc = context.read();
    controller.stop();
    logi(message: 'controller.torchState:${controller.torchState}');

    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    controller.stop();

    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CameraScanBloc>(
      create: (BuildContext context) => _cameraScanBloc,
      child: MultiBlocListener(
        listeners: <SingleChildWidget>[
          BlocListener<CameraScanBloc, CameraScanState>(
            listenWhen: (CameraScanState previous, CameraScanState current) =>
                previous.isTurnOnScan != current.isTurnOnScan,
            listener: (BuildContext context, CameraScanState state) {
              if (state.isTurnOnScan == true) {
                controller.start();
              } else {
                controller.stop();
              }
            },
          ),
          BlocListener<HomeBloc, HomeState>(
            listenWhen: (HomeState previous, HomeState current) =>
                previous.checkSerialState != current.checkSerialState,
            listener: (BuildContext context, HomeState state) {
              if (state.checkSerialState == LoadState.loading) {
                controller.stop();
                _cameraScanBloc.add(ToggleScanningEvent(
                  isTurnOn: false,
                ));
              }
            },
          ),
        ],
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 390.h,
              child: MobileScanner(
                fit: BoxFit.fill,
                controller: controller,
                // fit: BoxFit.contain,
                startDelay: true,
                errorBuilder:
                    (BuildContext p0, MobileScannerException p1, Widget? p2) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(
                        child: Text(
                            '//${p1.errorCode}\n${p1.errorDetails?.message}'),
                      ),
                      SBackButtonWidget(
                        title: 'Thử lại',
                        onTap: () {
                          controller.start();
                        },
                      )
                    ],
                  );
                },

                onDetect: (BarcodeCapture capture) {
                  final List<Barcode> barcodes = capture.barcodes;

                  for (final Barcode barcode in barcodes) {
                    debugPrint('Barcode found! ${barcode.rawValue}');
                    final String value = barcode.rawValue ?? '';
                    _homeBloc.add(CheckSerialEvent(serial: value));
                  }
                },
              ),
            ),
            Positioned(
              child: Column(
                children: <Widget>[
                  Text(
                    'Căn mạch vào giữa màn hình',
                    style: WowTextTheme.ts16w400(context)
                        .copyWith(color: ColorConstant.kNeuTral04),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomPaint(
                    size: Size(
                        MediaQuery.of(context).size.width * 0.5.w,
                        (MediaQuery.of(context).size.width * 0.15.w)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RPSCustomPainter(),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(onTap: () {
                        logi(
                            message:
                                'controller.torchEnabled:${controller.torchEnabled}');
                        controller.toggleTorch();
                        _cameraScanBloc.add(ToggleTorchEvent(
                          isTurnOn:
                              controller.torchState.value == TorchState.on,
                        ));
                      }, child: BlocBuilder<CameraScanBloc, CameraScanState>(
                        builder: (_, CameraScanState state) {
                          final bool? isTurnOn = state.isTurnOnFlash;
                          final bool isTurnOnScan = state.isTurnOnScan ?? false;
                          if (isTurnOnScan) {
                            return SvgPicture.asset(
                              SvgPaths.icFlashlight,
                              color: isTurnOn == true
                                  ? ColorConstant.kWhite
                                  : ColorConstant.kPrimary01,
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      )),
                      BlocBuilder<CameraScanBloc, CameraScanState>(
                        buildWhen: (CameraScanState previous,
                                CameraScanState current) =>
                            previous.isTurnOnScan != current.isTurnOnScan,
                        builder: (_, CameraScanState state) {
                          final bool isTurnOn = state.isTurnOnScan ?? false;
                          if (!isTurnOn) {
                            return SizedBox.shrink();
                          }
                          return SizedBox(
                            width: 24.w,
                          );
                        },
                      ),
                      BlocBuilder<CameraScanBloc, CameraScanState>(
                        buildWhen: (CameraScanState previous,
                                CameraScanState current) =>
                            previous.isTurnOnScan != current.isTurnOnScan,
                        builder: (_, CameraScanState state) {
                          final bool isTurnOn = state.isTurnOnScan ?? false;
                          return InkWell(
                              onTap: () {
                                _cameraScanBloc.add(ToggleScanningEvent(
                                  isTurnOn: !isTurnOn,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.all(24.w),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorConstant.kPrimary01),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  isTurnOn ? 'Stop' : 'Scan',
                                  style:
                                      WowTextTheme.ts14w600(context).copyWith(
                                    color: !isTurnOn
                                        ? ColorConstant.kTextColor
                                        : ColorConstant.kWhite,
                                  ),
                                ),
                              ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
