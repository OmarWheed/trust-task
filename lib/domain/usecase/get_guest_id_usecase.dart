import 'package:injectable/injectable.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/data/models/guest_id_response_dto.dart';
import 'package:trust_task/domain/repo/guest_repo.dart';

@lazySingleton
class GetGuestIdUsecase {
  final GuestRepo _guestRepo;

  const GetGuestIdUsecase(this._guestRepo);

  Future<Result<GuestIdResponseDto>> call() => _guestRepo.getGuestId();
}
