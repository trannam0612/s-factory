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

class CameraScanSerialWidget extends StatefulWidget {
  const CameraScanSerialWidget({
    super.key,
  });

  @override
  State<CameraScanSerialWidget> createState() => _CameraScanSerialWidgetState();
}

class _CameraScanSerialWidgetState extends State<CameraScanSerialWidget> {
  late MobileScannerController controller;

  late CameraScanBloc _cameraScanBloc;
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController();
    _cameraScanBloc = getIt();
    _homeBloc = context.read();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller.stop();
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
              children: [
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
                  height: 174.h,
                  width: 257.w,
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
