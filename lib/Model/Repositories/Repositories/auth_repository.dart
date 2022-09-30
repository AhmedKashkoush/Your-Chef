import 'dart:io';

import 'package:your_chief/Model/Repositories/Structure/auth_structure.dart';

class AuthRepository implements IAuthRepository {
  final IAuthRepository repository;
  const AuthRepository(this.repository);

  @override
  Future login(String email, String password) async {
    return await repository.login(email, password);
  }

  @override
  Future register(
      String name, String phone, String email, String password) async {
    return await repository.register(name, phone, email, password);
  }

  @override
  Future sendOtp(String email) async {
    return await repository.sendOtp(email);
  }

  @override
  Future uploadPhoto(String email, File photo) async {
    return await repository.uploadPhoto(email, photo);
  }

  @override
  Future verifyOtp(String email, String code) async {
    return await repository.verifyOtp(email, code);
  }
}
