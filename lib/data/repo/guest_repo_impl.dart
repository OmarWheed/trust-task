import 'package:injectable/injectable.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/data/data_source/guest_data_source.dart';
import 'package:trust_task/data/data_source/cart_local_data_source.dart';
import 'package:trust_task/data/models/guest_id_response_dto.dart';
import 'package:trust_task/domain/repo/guest_repo.dart';

@LazySingleton(as: GuestRepo)
class GuestRepoImpl implements GuestRepo {
  final GuestDataSource _dataSource;
  final CartLocalDataSource _localDataSource;

  const GuestRepoImpl(this._dataSource, this._localDataSource);

  @override
  Future<Result<GuestIdResponseDto>> getGuestId() async {
    final storedId = _localDataSource.getGuestId();
    if (storedId != null) {
      return Success(GuestIdResponseDto(guestId: storedId));
    }

    final result = await _dataSource.getGuestId();
    if (result is Success<GuestIdResponseDto>) {
      await _localDataSource.saveGuestId(result.data.guestId);
    }
    return result;
  }
}
