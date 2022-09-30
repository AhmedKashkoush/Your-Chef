import 'dart:io';

import 'package:flutter/material.dart';

@immutable
abstract class IAuthRepository {
  Future login(String email, String password);
  Future register(String name, String phone, String email, String password);
  Future uploadPhoto(String email, File photo);
  Future sendOtp(String email);
  Future verifyOtp(String email, String code);
}
