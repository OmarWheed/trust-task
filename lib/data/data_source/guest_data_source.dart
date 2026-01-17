import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/data/models/guest_id_response_dto.dart';

abstract interface class GuestDataSource {
  Future<Result<GuestIdResponseDto>> getGuestId();
}
