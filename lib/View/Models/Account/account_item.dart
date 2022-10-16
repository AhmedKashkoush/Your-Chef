import 'package:flutter/cupertino.dart';
import 'package:your_chief/Controllers/Account/account_controller.dart';

class AccountItem {
  final String name;
  final IconData icon;
  final Color? color;
  final AccountOptions option;

  const AccountItem({
    required this.name,
    required this.icon,
    this.color,
    required this.option,
  });
}
