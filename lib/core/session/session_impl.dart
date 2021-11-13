import 'package:anilist_app/core/session/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionImpl implements Session {
  @override
  String userId;

  @override
  String token;

  SessionImpl(this.userId, this.token);

  @override
  Future<void> login(String token) async {
    this.token = token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setInt(
      'expiry',
      DateTime.now().add(Duration(seconds: 31536000)).millisecondsSinceEpoch,
    );
  }

  @override
  Future<void> logout() async {}
}
