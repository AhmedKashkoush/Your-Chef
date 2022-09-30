class ApiHeaders {
  static const String apiKey = 'yourchefproject';
  static const String accept = 'application/json';

  static const Map<String, String> authHeaders = {
    'X-Authorization': apiKey,
  };

  static const Map<String, dynamic> accessHeaders = {
    'X-Authorization': apiKey,
    'Accept': accept,
  };
}
