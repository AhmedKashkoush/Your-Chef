import 'package:your_chief/Core/Constants/app_translation_keys.dart';

class Validation {
  static final Map<String, String> _messages = {
    'required': AppTranslationKeys.requiredField,
    'name.length': AppTranslationKeys.nameLength,
    'phone': AppTranslationKeys.notValidPhone,
    'email': AppTranslationKeys.notValidEmail,
    'password.length': AppTranslationKeys.passwordLength,
    'password.valid': AppTranslationKeys.validPassword,
    'confirm': AppTranslationKeys.confirmPasswordValidation,
  };

  String? get required {
    return _messages['required'];
  }

  String? get name {
    return _messages['name.length'];
  }

  String? get notValidPhone {
    return _messages['phone'];
  }

  String? get notValidEmail {
    return _messages['email'];
  }

  String? get passwordLength {
    return _messages['password.length'];
  }

  String? get notValidPassword {
    return _messages['password.valid'];
  }

  String? get confirm {
    return _messages['confirm'];
  }
}
