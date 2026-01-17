// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:talker_dio_logger/talker_dio_logger.dart' as _i52;

import '../../data/data_source/cart_local_data_source.dart' as _i217;
import '../../data/data_source/cart_remote_data_source.dart' as _i986;
import '../../data/data_source/cart_remote_data_source_impl.dart' as _i172;
import '../../data/data_source/category_data_source.dart' as _i76;
import '../../data/data_source/category_data_source_impl.dart' as _i933;
import '../../data/data_source/guest_data_source.dart' as _i378;
import '../../data/data_source/guest_data_source_impl.dart' as _i812;
import '../../data/repo/cart_repo_impl.dart' as _i818;
import '../../data/repo/category_repo_impl.dart' as _i57;
import '../../data/repo/guest_repo_impl.dart' as _i601;
import '../../domain/repo/cart_repo.dart' as _i985;
import '../../domain/repo/category_repo.dart' as _i410;
import '../../domain/repo/guest_repo.dart' as _i850;
import '../../domain/usecase/add_cart_usecase.dart' as _i390;
import '../../domain/usecase/delete_cart_usecase.dart' as _i641;
import '../../domain/usecase/get_cart_details_usecase.dart' as _i163;
import '../../domain/usecase/get_categories_usecase.dart' as _i397;
import '../../domain/usecase/get_guest_id_usecase.dart' as _i234;
import '../../presentation/view_model/cart_view_model/cart_viewmodel.dart'
    as _i551;
import '../../presentation/view_model/categories_view_model/categoires_view_model.dart'
    as _i485;
import '../api/api_client.dart' as _i277;
import '../api/api_module.dart' as _i0;
import 'prefs_module.dart' as _i891;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final prefsModule = _$PrefsModule();
    final apiModule = _$ApiModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => prefsModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.BaseOptions>(() => apiModule.providerOption());
    gh.lazySingleton<_i52.TalkerDioLogger>(() => apiModule.provideLogger());
    await gh.lazySingletonAsync<_i361.Dio>(
      () => apiModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i52.TalkerDioLogger>(),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i277.ApiClient>(
      () => apiModule.provideApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i378.GuestDataSource>(
      () => _i812.GuestDataSourceImpl(gh<_i277.ApiClient>()),
    );
    gh.lazySingleton<_i76.CategoryDataSource>(
      () => _i933.CategoryDataSourceImpl(gh<_i277.ApiClient>()),
    );
    gh.lazySingleton<_i986.CartRemoteDataSource>(
      () => _i172.CartRemoteDataSourceImpl(gh<_i277.ApiClient>()),
    );
    gh.lazySingleton<_i217.CartLocalDataSource>(
      () => _i217.CartLocalDataSourceImpl(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i410.CategoryRepo>(
      () => _i57.CategoryRepoImpl(gh<_i76.CategoryDataSource>()),
    );
    gh.lazySingleton<_i850.GuestRepo>(
      () => _i601.GuestRepoImpl(
        gh<_i378.GuestDataSource>(),
        gh<_i217.CartLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i985.CartRepo>(
      () => _i818.CartRepoImpl(
        gh<_i986.CartRemoteDataSource>(),
        gh<_i217.CartLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i390.AddCartUseCase>(
      () => _i390.AddCartUseCase(gh<_i985.CartRepo>()),
    );
    gh.lazySingleton<_i641.DeleteCartUseCase>(
      () => _i641.DeleteCartUseCase(gh<_i985.CartRepo>()),
    );
    gh.lazySingleton<_i163.GetCartDetailsUseCase>(
      () => _i163.GetCartDetailsUseCase(gh<_i985.CartRepo>()),
    );
    gh.lazySingleton<_i551.CartViewModel>(
      () => _i551.CartViewModel(gh<_i985.CartRepo>()),
    );
    gh.lazySingleton<_i397.GetCategoriesUseCase>(
      () => _i397.GetCategoriesUseCase(gh<_i410.CategoryRepo>()),
    );
    gh.lazySingleton<_i485.CategoiresViewModel>(
      () => _i485.CategoiresViewModel(gh<_i410.CategoryRepo>()),
    );
    gh.lazySingleton<_i234.GetGuestIdUsecase>(
      () => _i234.GetGuestIdUsecase(gh<_i850.GuestRepo>()),
    );
    return this;
  }
}

class _$PrefsModule extends _i891.PrefsModule {}

class _$ApiModule extends _i0.ApiModule {}
