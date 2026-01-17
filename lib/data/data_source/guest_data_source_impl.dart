import 'package:injectable/injectable.dart';
import 'package:trust_task/core/api/api_client.dart';
import 'package:trust_task/core/error/execute_api.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/data/data_source/guest_data_source.dart';
import 'package:trust_task/data/models/guest_id_response_dto.dart';

@LazySingleton(as: GuestDataSource)
class GuestDataSourceImpl implements GuestDataSource {
  final ApiClient _apiService;

  const GuestDataSourceImpl(this._apiService);
  @override
  Future<Result<GuestIdResponseDto>> getGuestId() {
    return executeApi(() => _apiService.getGuestId());
  }
}
