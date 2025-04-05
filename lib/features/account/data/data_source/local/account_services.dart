import 'dart:convert';
import 'package:signx/core/shared_pref/shared_pref_helper.dart';
import 'package:signx/features/account/domain/entities/account_user.dart';

class AccountServices {
  Future<AccountUser?> getUserData() async {
    try {
      final userJson = await SharedPrefsHelper.getUser();

      if (userJson == null) return null;

      final decoded = jsonDecode(userJson);
      return AccountUser.fromJson(decoded);
    } catch (e) {
      rethrow;
    }
  }
}
