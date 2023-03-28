import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  AuthCubit() : super(AuthState.unknown);

  Future<void> checkDeviceBiometric() async {
    bool isAvailable = false;
    isAvailable = await _localAuthentication.canCheckBiometrics;
    if (isAvailable) {
      List<BiometricType> types =
          await _localAuthentication.getAvailableBiometrics();
      types.map((e) => print("->>$e"));
    } else {
      emit(AuthState.notSupported);
    }
  }

  Future<void> authenticate() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticate(
          localizedReason: "Auth for go deeper",
          options: const AuthenticationOptions(
              biometricOnly: true, stickyAuth: true));
      if (isAuthenticated) {
        emit(AuthState.authenticated);
      } else {
        emit(AuthState.unauthenticated);
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
