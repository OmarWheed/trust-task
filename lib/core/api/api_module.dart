import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trust_task/core/api/api_client.dart';
import 'package:trust_task/core/api/env.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

@module
abstract class ApiModule {
  @lazySingleton
  ApiClient provideApiClient(Dio dio) {
    return ApiClient(dio, baseUrl: Env.baseUrl);
  }

  @preResolve
  @lazySingleton
  Future<Dio> provideDio(BaseOptions option, TalkerDioLogger logger) async {
    var dio = Dio(option);

    dio.interceptors.add(logger);
    final credentials = 'testapp:5S0Q YjyH 4s3G elpe 5F8v u8as';
    final encodedCredentials = base64Encode(utf8.encode(credentials));

    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic $encodedCredentials',
    };

    return dio;
  }

  @lazySingleton
  BaseOptions providerOption() {
    return BaseOptions(
      baseUrl: Env.baseUrl,
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
  }

  @lazySingleton
  TalkerDioLogger provideLogger() {
    return TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printErrorHeaders: true,
        printResponseHeaders: true,
        printResponseMessage: true,
        printErrorMessage: true,
        printRequestData: true,
        printResponseData: true,
      ),
    );
  }
}
