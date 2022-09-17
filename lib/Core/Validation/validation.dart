class Validation {
  static final Map<String, String> _messages = {
    'email': 'not a valid email',
  };

  String? get notValidEmail {
    return _messages['email'];
  }
}
