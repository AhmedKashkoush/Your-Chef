abstract class IUserRepository {
  Future? getUser(String token);
  Future? editUser(String token, String name, int gender);
  Future? deleteUser(String token);
  Future? logout(String token);
  Future? setOnline(String token);
}
