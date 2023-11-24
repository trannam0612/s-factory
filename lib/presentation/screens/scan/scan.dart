import 'package:flutter/material.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String pathRoute = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {},
            child: Text(
              'Login',
            )),
      ),
    );
  }
}
