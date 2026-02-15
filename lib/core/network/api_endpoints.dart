class ApiEndpoints {
  static const String baseUrl = "https://dummyjson.com";

  // Auth endpoints
  static const String login = '$baseUrl/auth/login';
  static const String register = '$baseUrl/auth/register';
  static const String logout = '$baseUrl/auth/logout';
  static const String refreshToken = '$baseUrl/auth/refresh';

  // Notes endpoints
  static const String getNotes = '$baseUrl/posts';
  static const String createNote = '$baseUrl/notes';
  static const String getNote = '$baseUrl/notes';
  static const String updateNote = '$baseUrl/notes';
  static const String deleteNote = '$baseUrl/notes';

  // Users endpoints
  static const String getUser = '$baseUrl/user';
  static const String updateUser = '$baseUrl/user';
  static const String deleteUser = '$baseUrl/user';
}
