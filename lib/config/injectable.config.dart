// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobile_advanced/repository/i_poke_repository.dart' as _i5;
import 'package:mobile_advanced/routes/app_route.dart' as _i3;
import 'package:mobile_advanced/services/pokemon/api/dev_poke_api.dart' as _i6;
import 'package:mobile_advanced/services/pokemon/api/poke_api.dart' as _i7;
import 'package:mobile_advanced/services/pokemon/cubit/pokemon_cubit.dart'
    as _i8;

import '../services/provider/config_dio.dart' as _i9;

const String _dev = 'dev';
const String _prod = 'prod';

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
  gh.lazySingleton<_i5.IPokeRepository>(
    () => _i6.DevPokemonService(gh<_i4.Dio>()),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i5.IPokeRepository>(
    () => _i7.PokemonService(dio: gh<_i4.Dio>()),
    registerFor: {_prod},
  );
  gh.factory<_i8.PokemonCubit>(
      () => _i8.PokemonCubit(gh<_i5.IPokeRepository>()));
  return getIt;
}

class _$DioConf extends _i9.DioConf {}
