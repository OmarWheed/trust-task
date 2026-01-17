import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class CartLocalDataSource {
  Future<void> saveGuestId(String guestId);
  String? getGuestId();
}

@LazySingleton(as: CartLocalDataSource)
class CartLocalDataSourceImpl implements CartLocalDataSource {
  final SharedPreferences _prefs;
  static const String _guestIdKey = 'guest_id';

  const CartLocalDataSourceImpl(this._prefs);

  @override
  Future<void> saveGuestId(String guestId) async {
    await _prefs.setString(_guestIdKey, guestId);
  }

  @override
  String? getGuestId() {
    return _prefs.getString(_guestIdKey);
  }
}
