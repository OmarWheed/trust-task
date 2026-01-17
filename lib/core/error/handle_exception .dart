import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:trust_task/core/error/api_error_response_dto.dart';
class NetworkException {
  static String getMessageError(Exception exception) {
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
          return 'errors.connectionTimeout'.tr();
        case DioExceptionType.sendTimeout:
          return 'errors.sendTimeout'.tr();
        case DioExceptionType.receiveTimeout:
          return 'errors.receiveTimeout'.tr();
        case DioExceptionType.badCertificate:
          return 'errors.badCertificate'.tr();
        case DioExceptionType.badResponse:
          return _handleMessageResponse(exception);
        case DioExceptionType.cancel:
          return 'errors.cancel'.tr();
        case DioExceptionType.connectionError:
          return 'errors.connectionError'.tr();
        case DioExceptionType.unknown:
          return 'errors.unknown'.tr();
      }
    } else {
      return exception.toString();
    }
  }

  static String _handleMessageResponse(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final data = e.response!.data;

      try {
        // Try to parse as ApiErrorResponseDto
        if (data is Map<String, dynamic>) {
          final errorResponse = ApiErrorResponseDto.fromJson(data);
          return _getErrorMessage(errorResponse.code, errorResponse.message, errorResponse.data.status);
        }
      } catch (_) {
        // Fallback to status code handling
      }

      // Fallback to status code handling
      switch (statusCode) {
        case 400:
          return 'errors.error400'.tr();
        case 401:
          return 'errors.error401'.tr();
        case 403:
          return 'errors.error403'.tr();
        case 404:
          return 'errors.error404'.tr();
        case 408:
          return 'errors.error408'.tr();
        case 429:
          return 'errors.error429'.tr();
        case 500:
          return 'errors.error500'.tr();
        case 502:
          return 'errors.error502'.tr();
        case 503:
          return 'errors.error503'.tr();
        case 504:
          return 'errors.error504'.tr();
        default:
          if (data is Map && data['message'] != null) {
            return data['message'].toString();
          }
          return 'errors.serverError'.tr(args: [statusCode.toString()]);
      }
    }
    return 'errors.defaultError'.tr();
  }

  static String _getErrorMessage(String code, String message, int status) {
    final errorKey = 'errors.api_$code';
    
    // Check if localized error code exists, otherwise use message
    try {
      return errorKey.tr();
    } catch (_) {
      // If translation key doesn't exist, fall back to message or status-based error
      switch (status) {
        case 400:
          return message.isNotEmpty ? message : 'errors.error400'.tr();
        case 401:
          return message.isNotEmpty ? message : 'errors.error401'.tr();
        case 403:
          return message.isNotEmpty ? message : 'errors.error403'.tr();
        case 404:
          return message.isNotEmpty ? message : 'errors.error404'.tr();
        case 500:
          return message.isNotEmpty ? message : 'errors.error500'.tr();
        default:
          return message.isNotEmpty ? message : 'errors.serverError'.tr(args: [status.toString()]);
      }
    }
  }
}
