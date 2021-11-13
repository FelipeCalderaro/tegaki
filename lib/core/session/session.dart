abstract class Session {
  String userId;
  String token;
  Future<void> login(String token);
  Future<void> logout();

  Session(this.userId, this.token);
}
