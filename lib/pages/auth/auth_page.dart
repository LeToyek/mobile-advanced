import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced/pages/layout/base_layout.dart';
import 'package:mobile_advanced/services/auth/cubit/auth_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const route = "/auth";
  static const name = "auth";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit()..checkDeviceBiometric(),
      child: BaseLayout(
          title: "Auth",
          contentWidget: Center(
            child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
              if (state != AuthState.notSupported) {
                if (state == AuthState.authenticated) {
                  return const Text("Authenticated");
                } else if (state == AuthState.unauthenticated) {
                  return const Text("Auth Failed");
                }
                return IconButton(
                    onPressed: () => context.read<AuthCubit>().authenticate(),
                    icon: const Icon(Icons.fingerprint));
              }
              return const Text("Device not supported");
            }),
          )),
    );
  }
}
