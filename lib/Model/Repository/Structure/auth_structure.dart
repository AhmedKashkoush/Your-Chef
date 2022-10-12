import 'dart:io';

import 'package:flutter/material.dart';

@immutable
abstract class IAuthRepository {
  Future login(String email, String password);
  Future register(
      String name, int gender, String phone, String email, String password);
  Future uploadPhoto(String email, File photo);
  Future sendOtp(String email);
  Future verifyOtp(String email, String code);
  Future resetPassword(String email, String newPassword);
  Future changePassword(String email, String newPassword);
  Future sendOtpMail(String email);
  Future verifyOtpMail(String email, String code);
}
