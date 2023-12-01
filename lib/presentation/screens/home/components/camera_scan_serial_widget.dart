import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/screens/home/blocs/camera_scan_bloc/camera_scan_bloc.dart';
import 'package:s_factory/presentation/screens/home/blocs/home_bloc/home_bloc.dart';
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
      detectionSpeed: DetectionSpeed.normal,
    );
    _cameraScanBloc = getIt();
    _homeBloc = context.read();
    controller.stop();

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
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 390.h,
            child: MobileScanner(
              controller: controller,
              // fit: BoxFit.contain,
              startDelay: true,
              errorBuilder:
                  (BuildContext p0, MobileScannerException p1, Widget? p2) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child:
                          Text('${p1.errorCode}\n${p1.errorDetails?.message}'),
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
                SvgPicture.asset(
                  SvgPaths.imgScanFrame,
                  height: 200.h,
                  width: 500.w,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 32.h,
                ),
                InkWell(onTap: () {
                  controller.toggleTorch();
                  _cameraScanBloc.add(ToggleTorchEvent(
                    isTurnOn: controller.torchState.value == TorchState.on,
                  ));
                }, child: BlocBuilder<CameraScanBloc, CameraScanState>(
                  builder: (_, CameraScanState state) {
                    final bool? isTurnOn = state.isTurnOnFlash;
                    return SvgPicture.asset(
                      SvgPaths.icFlashlight,
                      color: isTurnOn == true
                          ? ColorConstant.kWhite
                          : ColorConstant.kPrimary01,
                    );
                  },
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
