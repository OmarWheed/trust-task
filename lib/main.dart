import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_task/core/di/di.dart';
import 'package:trust_task/domain/usecase/get_guest_id_usecase.dart';
import 'package:trust_task/presentation/view_model/cart_view_model/cart_viewmodel.dart';
import 'package:trust_task/presentation/view_model/categories_view_model/categoires_view_model.dart';

import 'package:trust_task/presentation/views/main_layout.dart/main_layout_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
  
  // Initialize guest ID on app startup
  final getGuestIdUsecase = getIt.get<GetGuestIdUsecase>();
  await getGuestIdUsecase.call();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<CartViewModel>()..getOrders(),
        ),
        BlocProvider(
          create: (context) => getIt.get<CategoiresViewModel>()..fetchCategories(),
        ),
      ],
      child: MaterialApp(
        title: 'Trust Task',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const MainLayoutView(),
      ),
    );
  }
}