import 'package:your_chief/Model/Repository/Structure/user_structure.dart';

class UserRepository implements IUserRepository {
  final IUserRepository repository;

  const UserRepository(this.repository);

  @override
  Future? deleteUser(String token) async {
    return await repository.deleteUser(token);
  }

  @override
  Future? editUser(String token, String name, int gender) async {
    return await repository.editUser(token, name, gender);
  }

  @override
  Future? getUser(String token) async {
    return await repository.getUser(token);
  }

  @override
  Future? logout(String token) async {
    return await repository.logout(token);
  }

  @override
  Future? setOnline(String token) async {
    return await repository.setOnline(token);
  }
}
