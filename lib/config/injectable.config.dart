// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobile_advanced/routes/app_route.dart' as _i3;
import 'package:mobile_advanced/services/api/poke_api.dart' as _i5;
import 'package:mobile_advanced/services/cubit/pokemon_cubit.dart' as _i6;

import '../services/api/config_dio.dart' as _i7;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioConf = _$DioConf();
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.factory<_i4.Dio>(() => dioConf.dio);
  gh.lazySingleton<_i5.PokemonService>(
      () => _i5.PokemonService(dio: gh<_i4.Dio>()));
  gh.factory<_i6.PokemonCubit>(
      () => _i6.PokemonCubit(gh<_i5.PokemonService>()));
  return getIt;
}

class _$DioConf extends _i7.DioConf {}
